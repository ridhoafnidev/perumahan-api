<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pegawai extends Model
{
    protected $table = 'tb_pegawai';

    public $timestamps = false;

    protected $fillable = [
        'id', 'user_id', 'nama_lengkap', 'email', 'alamat', 'no_hp'
    ];
}
