<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CalonPemilik extends Model
{

    protected $table = 'tb_calon_pemilik';

    public $timestamps = false;

    protected $fillable = [
        'id', 'konsumen_id', 'rumah_id', 'status_permohonan', 'jumlah_dp', 'bukti_transfer',
        'tanggal_pengajuan', 'tanggal_update_bukti_transfer'
    ];
}
