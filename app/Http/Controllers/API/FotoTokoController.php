<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\FotoToko;
use App\Models\Toko;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FotoTokoController extends Controller
{
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $nama_toko = $request->input('nama_toko');

        if($id)
        {
            $toko = FotoToko::find($id);

            if($toko)
            {
                return ResponseFormatter::success(
                    $toko,
                    'List Foto Toko berhasil diambil'
                );
            } else {
                return ResponseFormatter::error(
                    null,
                    'Data Foto Toko tidak ada',
                    404
                );
            }
        }

        $toko = FotoToko::query();

        return ResponseFormatter::success(
            $toko->paginate($limit),
            'Data List Foto toko berhasil diambil',
        );
    }

    public function uploadfoto(Request $request)
    {
        try {
            
            $validator = Validator::make($request->all(),[
                'file' => 'required', 'image', 'max:1024',
            ]);

            if($validator->fails()){
                return ResponseFormatter::error([
                    'error' => $validator->errors()
                ], 'update photo gagal', 401);
            }

            $cektoko = Toko::find('id');
            // dd($cektoko);

            $check_foto_toko = FotoToko::where($cektoko)->count();
            // dd($check_foto_toko);

            if ($check_foto_toko > 3) {
                return ResponseFormatter::error([
                    'message' => 'Tidak bisa mengupload gambar lebih dari 3',
                ]);
                
            } else {
                    $image = $request->file('file');
                    $file = $image->store('assets/toko', 'public');

                    //simapn foto ke database urlnya
                    $fototoko = FotoToko::create([
                        'url' => $file,
                        'tokos_id'  => $request->id,
                    ]);
            }
            
            return ResponseFormatter::success([
                'fototoko'  => $fototoko,
            ], 'Foto toko berhasil di tambahkan',
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
        $fototoko = FotoToko::findOrFail($id);

        $validator = Validator::make($request->all(),[
                'file' => 'required', 'image', 'max:1024',
            ]);

            if($validator->fails()){
                return ResponseFormatter::error([
                    'error' => $validator->errors()
                ], 'update photo gagal', 401);
            }
        
        $fototoko->url = $request->url;
        $image = $request->file('file');
        $file = $image->store('assets/toko', 'public');

        return ResponseFormatter::success($file, 'Toko berhasil di update');
    }

    public function destroy($id)
    {
        $toko = FotoToko::find($id);
        $toko->delete();
        return ResponseFormatter::success([
            'message' => 'Foto toko berhasil dihapus', 
        ]);
    }
}
