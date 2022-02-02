<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FotoTipeRumah extends Model
{

    protected $table = 'tb_foto_tipe_rumah';

    protected $fillable = [
      'id', 'tipe_rumah_id', 'foto'
    ];
}
