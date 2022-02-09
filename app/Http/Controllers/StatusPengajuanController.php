<?php

namespace App\Http\Controllers;

use App\Models\StatusPengajuan;
use Illuminate\Http\Request;

class StatusPengajuanController extends Controller
{
    public function getStatusPengajuanAll()
    {
        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "Berhasil mendapatkan hasil pengajuan",
            'result' => StatusPengajuan::all()
        ]);
    }

    public function getStatusPengajuanById(int $id)
    {
        $statusPengajuan = StatusPengajuan::find($id);
        if (!$statusPengajuan) {
            return response()->json([
                'code' => 404,
                'status' => "Not Found",
                'message' => 'Status pengajuan tidak ditemukan!',
                'result' => ''
            ], 404);
        }
        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => 'Calon pemilik ditemukan!',
            'result' => $statusPengajuan
        ], 200);
    }
}
