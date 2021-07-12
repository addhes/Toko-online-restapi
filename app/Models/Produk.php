<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_produk','harga','stok','nomor_rak','tokos_id',
    ];

    protected $table = 'produks';

    public function galleriesproduk()
    {
        return $this->hasMany(Produkfoto::class, 'produks_id', 'id');
    }

    public function toko()
    {
        return $this->belongsTo(Toko::class, 'tokos_id', 'id');
    }
}
