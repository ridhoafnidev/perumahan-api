<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CalonPemilik extends Model
{

    protected $table = 'tb_calon_pemilik';

    public $timestamps = false;

    protected $fillable = [
        'id', 'tipe_perumahan_id', 'konsumen_id', 'rumah_id', 'status_pengajuan_id', 'jumlah_dp', 'bukti_transfer', 'dokumen_pengajuan',
        'tanggal_pengajuan', 'tanggal_update_bukti_transfer'
    ];
}
