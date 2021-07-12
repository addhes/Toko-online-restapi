<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Toko extends Model
{
    use HasFactory;

    protected $table = 'tokos';

    protected $fillable = [
        'nama_toko','alamat','kota','propinsi','nama_pemilik','users_id',
    ];

    public function fototoko()
    {
        return $this->hasMany(FotoToko::class, 'tokos_id', 'id');
    }

    public function users()
    {
        return $this->hasOne(User::class,  'id', 'users_id',);
    }
}
