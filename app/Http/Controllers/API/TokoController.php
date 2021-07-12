<?php

namespace App\Http\Controllers\API;

use App\Models\Toko;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TokoController extends Controller
{
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $nama_toko = $request->input('nama_toko');
        $alamat = $request->input('alamat');
        $kota = $request->input('kota');
        $propinsi = $request->input('propinsi');
        $pemilik = $request->input('pemilik');

        if($id)
        {
            $toko = Toko::find($id);

            if($toko)
            {
                return ResponseFormatter::success(
                    $toko,
                    'Data toko berhasil diambil'
                );
            } else {
                return ResponseFormatter::error(
                    null,
                    'Data produk tidak ada',
                    404
                );
            }
        }

        $toko = Toko::query();

        if($nama_toko)
        {
            $toko->where('nama_toko','like','%' . $nama_toko . '%');
        }

        if($alamat)
        {
            $toko->where('alamat','like','%' . $alamat . '%');
        }

        if($kota)
        {
            $toko->where('kota','like','%' . $kota . '%');
        }

        if($propinsi)
        {
            $toko->where('propinsi','like','%' . $propinsi . '%');
        }

        if($pemilik)
        {
            $toko->where('pemi$pemilik','like','%' . $pemilik . '%');
        }

        return ResponseFormatter::success(
            $toko->paginate($limit),
            'Data List toko berhasil diambil',
        );
    }

    public function create(Request $request)
    {
        try {
            
            $validator = Validator::make($request->all(),[
                'nama_toko' => ['required', 'string', 'max:255'],
                'alamat' => ['required','string', 'max:255',],
                'kota' => ['required', 'string', 'max:255'],
                'propinsi' => ['required', 'string', 'max:255'],
                'nama_pemilik' => ['required', 'string', 'max:255'],
            ]);

            if($validator->fails()){
                return response()->json($validator->errors(), 400);
            }
            
            $cekuser = Auth::user()->id;

            $check_data_toko = Toko::where("users_id", $cekuser)->count();
            
            if ($check_data_toko >= 3) {
                return ResponseFormatter::error([
                    'message' => 'Tidak bisa membuat toko lebih dari 3',
                ]);
            } else {
                $user = Toko::create([
                    'nama_toko'  => $request->nama_toko,
                    'alamat' => $request->alamat,
                    'kota'  => $request->kota,
                    'propinsi'  => $request->propinsi,
                    'nama_pemilik'  => $request->nama_pemilik,
                    'users_id'  => Auth::user()->id,
                ]);
            }
           
            return ResponseFormatter::success([
                'toko'  => $user,
            ], 'User Terdaftar',
        );

        } catch (\Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ], 'Authentication Failed', 500);
        }
    }

    public function update(Request $request, $id)
    {
        $toko = Toko::findOrFail($id);
        $toko->nama_toko = $request->nama_toko;
        $toko->alamat = $request->alamat;
        $toko->kota = $request->kota;
        $toko->propinsi = $request->propinsi;
        $toko->nama_pemilik = $request->nama_pemilik;
        $toko->users_id = Auth::user()->id;

        return ResponseFormatter::success($toko, 'Toko berhasil di update');
    }

    public function destroy($id)
    {
        $toko = Toko::find($id);
        $toko->delete();
        return ResponseFormatter::success([
            'message' => 'Data toko berhasil dihapus', 
        ]);
    }
}
