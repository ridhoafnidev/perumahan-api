<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Perumahan extends Model
{
    protected $table = 'tb_master_perumahan';

    public $timestamps = false;

    protected $fillable = [
        'id', 'tipe_perumahan_id', 'nama_perumahan', 'luas_tanah', 'alamat', 'keterangan'
    ];
}
