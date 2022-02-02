<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipePerumahan extends Model
{

    protected $table = 'tb_tipe_perumahan';

    protected $fillable = [
        'id', 'nama_tipe', 'ukuran', 'pondasi', 'dinding', 'lantai', 'plafon', 'pintu_depan', 'dinding_km', 'kusen',
        'r_atap', 'p_atap', 'sanitasi', 'listrik', 'air', 'harga', 'jumlah_unit', 'perumahan_id'
    ];

}
