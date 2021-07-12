<?php

namespace App\Http\Controllers\API;

use App\Models\Produk;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Toko;
use Illuminate\Support\Facades\Validator;

class ProdukController extends Controller
{
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $nama_produk = $request->input('nama_produk');
        $harga = $request->input('harga');
        $stok = $request->input('stok');
        $nomor_rak = $request->input('nomor_rak');

        if($id)
        {
            $toko = Produk::find($id);

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

        $toko = Produk::query();

        if($nama_produk)
        {
            $toko->where('nama_produk','like','%' . $nama_produk . '%');
        }

        if($harga)
        {
            $toko->where('harga','like','%' . $harga . '%');
        }

        if($stok)
        {
            $toko->where('stok','like','%' . $stok . '%');
        }

        if($nomor_rak)
        {
            $toko->where('nomor_rak','like','%' . $nomor_rak . '%');
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
                'nama_produk' => ['required', 'string', 'max:255'],
                'harga' => ['required','string', 'max:255',],
                'stok' => ['required', 'string', 'max:255'],
                'nomor_rak' => ['required', 'string', 'max:255'],
            ]);

            if($validator->fails()){
                return response()->json($validator->errors(), 400);
            }
            
            $cekuser = Toko::find('id');

            $check_data_toko = Produk::where($cekuser)->count();
            
            if ($check_data_toko >= 3) {
                return ResponseFormatter::error([
                    'message' => 'Tidak bisa menambahkan produk lebih dari 3',
                ], 'Gagal menambahkan produk');
            } else {
                $produk = Produk::create([
                    'nama_produk'  => $request->nama_produk,
                    'harga' => $request->harga,
                    'stok'  => $request->stok,
                    'nomor_rak'  => $request->nomor_rak,
                    'tokos_id'  => $request->id,
                ]);
            }
           
            return ResponseFormatter::success([
                'produk'  => $produk,
                'message'   => 'Produk Berhasil ditambahkan'
            ], 'Sukses',
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
        $produk = Produk::findOrFail($id);
        $produk->nama_produk = $request->nama_produk;
        $produk->harga = $request->harga;
        $produk->stok = $request->stok;
        $produk->nomor_rak = $request->nomor_rak;
        $produk->nama_pemilik = $request->nama_pemilik;

        return ResponseFormatter::success($produk, 'Produk berhasil di update');
    }

    public function destroy($id)
    {
        $produk = Produk::find($id);
        $produk->delete();
        return ResponseFormatter::success([
            'message' => 'Produk berhasil dihapus', 
        ]);
    }
}
