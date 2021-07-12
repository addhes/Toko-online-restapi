<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class FotoToko extends Model
{
    use HasFactory;

    protected $table = 'foto_tokos';

    protected $fillable = [
        'tokos_id', 'url'
    ];

    // konvert menjadi url
    public function getUrlAttribute($url)
    {
        return config('app.url') . Storage::url($url);
    }

    public function toko()
    {
        return $this->belongsTo(Toko::class, 'id', 'tokos_id',);
    }
}
