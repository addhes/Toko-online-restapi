<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Mail\TestMail;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Notifications\WelcomeEmailNotification;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'email|required',
                'password'  => 'required'
            ]);

            // if($validator->fails()){
            //     return response()->json($validator->errors(), 400);
            // }

            $credentials = request(['email', 'password']);
            if(!Auth::attempt($credentials)){
                return ResponseFormatter::error([
                    'message'   => 'Unauthorized',
                ], 'Authentication Failed', 500);
            }

            $user = User::where('email', $request->email)->first();

            if(!Hash::check($request->password, $user->password, [])){
                throw new \Exception('Invalid Credentials');
            }

            $tokenResult = $user->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user'  => $user
            ], 'Authenticated');

        } catch (\Exception $error) {
            return ResponseFormatter::error([
                'message'   => 'Something went wrong',
                'error' => $error,
            ], 'Authentication Failed', 500);
        }
    }

    public function register(Request $request)
    {
        try {
            $validator = Validator::make($request->all(),[
                'name' => ['required', 'string', 'max:255'],
                'email' => ['required', 'email', 'max:255', 'unique:users'],
                'telepone' => ['required', 'string', 'max:13'],
                'username' => ['required', 'string', 'max:255'],
                'password' => ['required', 'string', 'min:8']
            ]);

            if($validator->fails()){
                return response()->json($validator->errors(), 400);
            }

            $usernew = User::create([
                'name'  => $request->name,
                'email' => $request->email,
                'telepone'  => $request->telepone,
                'username'  => $request->username,
                'password'  => Hash::make($request->password),
            ]);

            
            $user = User::where('email', $request->email)->first();
            
            $tokenResult = $user->createToken('authToken')->plainTextToken;

           
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type'   => 'Bearer',
                'user'  => $user,
            ], 'User Terdaftar',  $usernew->notify(new WelcomeEmailNotification()),
        );

            

            // $mailInfo = [
            //     'title' => 'Email dari Ade Setiawan',
            //     'body' => 'Selamat anda berhasil registrasi',
            // ];
             
            // Mail::to('setiawan.ade10@gmail.com')->send(new WelcomeMail($mailInfo));


        } catch (\Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ], 'Authentication Failed', 500);
        }
    }

    public function logout(Request $request)
    {
        $token = $request->user()->currentAccessToken()->delete();

        return ResponseFormatter::success($token, 'Token Revoked');
    }

    public function updateProfile(Request $request)
    {
        $data = $request->all();

        $user = Auth::user();
        $user->update($data);

        return ResponseFormatter::success($user, 'Profile Berhasil diupdate');
    }
}
