<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Direktur extends Model
{
    protected $table = 'tb_direktur';

    public $timestamps = false;

    protected $fillable = [
        'id', 'user_id', 'nama_lengkap', 'email', 'alamat', 'no_hp'
    ];
}
