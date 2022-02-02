<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MasterPerumahan extends Model
{

    protected $table = "tb_master_perumahan";

    protected $fillable = [
        'id', 'nama_perumahan', 'luas_tanah', 'alamat', 'keterangan'
    ];
}
