<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Konsumen extends Model
{

    protected $table = 'tb_konsumen';

    public $timestamps = false;

    protected $fillable = [
        'id', 'user_id', 'nama_lengkap', 'alamat', 'no_hp', 'email'
    ];

}
