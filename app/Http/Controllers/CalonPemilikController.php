<?php

namespace App\Http\Controllers;

use App\Models\CalonPemilik;
use Illuminate\Http\Request;

class CalonPemilikController extends Controller
{
    public function getCalonPemilikAll() {
        $listCalonPemilik = CalonPemilik::all()->sortByDesc('id');
        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "SUCCESS",
            'result' => $listCalonPemilik
        ], 200);
    }

    public function updateStatusCalonPemilik(Request $request)
    {
        $calonPemilik = CalonPemilik::find($request->id);

        $this->validate($request, [
            'status_pengajuan' => 'required'
        ]);

        if ($calonPemilik) {
            $calonPemilik->status_pengajuan = $request->status_pengajuan;
            $isSuccess = $calonPemilik->save();

            if ($isSuccess) {
                return response()->json([
                    'code' => 200,
                    'status' => "Success",
                    'message' => 'Status permohonan berhasil diupdate!',
                    'result' => ''
                ], 200);
            } else {
                return response()->json([
                    'code' => 500,
                    'status' => "Failed",
                    'message' => 'Status permohonan gagal diupdate!',
                    'result' => ''
                ], 500);
            }
        } else {
            return response()->json([
                'code' => 404,
                'status' => "Not Found",
                'message' => 'Calon pemilik tidak ditemukan@',
                'result' => ''
            ], 404);
        }
    }
}
