<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatusPengajuan extends Model
{
    protected $table = 'tb_status_pengajuan';
    protected $fillable = ['id', 'nama'];
}
