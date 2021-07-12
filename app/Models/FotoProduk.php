<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class FotoProduk extends Model
{
    use HasFactory;

    protected $table = 'foto_produks';

    protected $fillable = [
        'produks_id', 'url'
    ];

    // konvert menjadi url
    public function getUrlAttribute($url)
    {
        return config('app.url') . Storage::url($url);
    }

    public function produk()
    {
        return $this->belongsTo(Produk::class, 'id', 'produks_id',);
    }
}
