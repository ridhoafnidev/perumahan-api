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
        ]);
    }

    public function insertCalonPemilik(Request $request)
    {
        $this->validate($request, [
            'konsumen_id' => 'required',
            'rumah_id' => 'required',
            'jumlah_dp' => 'required',
            'bukti_transfer' => 'required|image|mimes:jpeg,png,jpg|max:2048'
        ]);

        $buktiDP = $request->file('bukti_transfer');

        $namaBuktiDP = time() . '_' . $buktiDP->getClientOriginalName();

        $buktiDP->move('bukti transfer', $namaBuktiDP);

        $calonPemilik = CalonPemilik::create([
            'konsumen_id' => $request->konsumen_id,
            'rumah_id' => $request->rumah_id,
            'status_pengajuan' => 1,
            'jumlah_dp' => $request->jumlah_dp,
            'bukti_transfer' => $namaBuktiDP
        ]);

        if ($calonPemilik) {
            return response()->json([
                'code' => 200,
                'status' => "Success",
                'message' => 'Calon pemilik berhasil dibuat!',
                'result' => ''
            ], 200);
        } else {
            return response()->json([
                'code' => 500,
                'status' => "Failed",
                'message' => 'Calon pemilik gagal dibuat!',
                'result' => ''
            ], 500);
        }
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
