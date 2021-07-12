<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\FotoProduk;
use App\Models\Produk;
use Illuminate\Support\Facades\Validator;

class FotoProdukController extends Controller
{
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);

        if($id)
        {
            $toko = FotoProduk::find($id);

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

        $toko = FotoProduk::query();

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

            $cekproduk = Produk::find('id');

            $check_foto_produk = FotoProduk::where($cekproduk)->count();
            // dd($check_foto_produk);

            if ($check_foto_produk > 3) {
                return ResponseFormatter::error([
                    'message' => 'Gagal mengupload gambar',
                ], 'Tidak bisa mengupload gambar lebih dari 3');
                
            } else {
                    $image = $request->file('file');
                    $file = $image->store('assets/produk', 'public');

                    //simapn foto ke database urlnya
                    $fotoproduk = FotoProduk::create([
                        'url' => $file,
                        'produks_id'  => $request->id,
                    ]);
            }
            
            return ResponseFormatter::success([
                'fotoproduk'  => $fotoproduk,
            ], 'Foto Produk berhasil di tambahkan',
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
        $fotoproduk = FotoProduk::findOrFail($id);

        $validator = Validator::make($request->all(),[
                'file' => 'required', 'image', 'max:1024',
            ]);

            if($validator->fails()){
                return ResponseFormatter::error([
                    'error' => $validator->errors()
                ], 'update photo gagal', 401);
            }
        
        $fotoproduk->url = $request->url;
        $image = $request->file('file');
        $file = $image->store('assets/produk', 'public');

        return ResponseFormatter::success($file, 'Foto produk berhasil di update');
    }

    public function destroy($id)
    {
        $toko = FotoProduk::find($id);
        $toko->delete();
        return ResponseFormatter::success([
            'message' => 'Foto produk berhasil dihapus', 
        ]);
    }
}
