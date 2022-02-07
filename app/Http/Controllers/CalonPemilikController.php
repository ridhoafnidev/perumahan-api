<?php

namespace App\Http\Controllers;

use App\Models\CalonPemilik;
use App\Models\Konsumen;
use App\Models\MasterPerumahan;
use App\Models\TipePerumahan;
use Illuminate\Http\Request;

class CalonPemilikController extends Controller
{
    public function getCalonPemilikAll() {
        $listCalonPemilik = CalonPemilik::all()->sortByDesc('id');
        $data = [];

        foreach ($listCalonPemilik as $calonPemilik) {
            $konsumen = Konsumen::find($calonPemilik->konsumen_id);
            $calonPemilikItem['id'] = $calonPemilik->id;
            $calonPemilikItem['nama'] = $konsumen->nama_lengkap;
            $calonPemilikItem['alamat'] = $konsumen->alamat;
            $calonPemilikItem['tipe_rumah'] = MasterPerumahan::find($calonPemilik->rumah_id)->nama_perumahan;
            switch ($calonPemilik->status_pengajuan) {
                case 2:
                    $calonPemilikItem['status_pengajuan'] = 'Sudah Dihubungi';
                    break;
                case 3:
                    $calonPemilikItem['status_pengajuan'] = 'Diterima';
                    break;
                default:
                    $calonPemilikItem['status_pengajuan'] = 'Belum Dihubungi';
            }
            $data[] = $calonPemilikItem;
        }

        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "SUCCESS",
            'result' => $data
        ]);
    }

    public function getCalonPemilik($id)
    {
        $detailCalonPemilik = CalonPemilik::find($id);

        if (!$detailCalonPemilik) {
            return response()->json([
                'code' => 500,
                'status' => "Failed",
                'message' => 'Detail Calon pemilik tidak ditemukan!',
                'result' => ''
            ], 500);
        }

        $konsumen = Konsumen::find($detailCalonPemilik->konsumen_id);

        $detailCalonPemilik['konsumen_nama'] = $konsumen->nama_lengkap;
        $detailCalonPemilik['konsumen_alamat'] = $konsumen->alamat;
        $detailCalonPemilik['konsumen_no_hp'] = $konsumen->no_hp;
        $detailCalonPemilik['konsumen_email'] = $konsumen->email;
        $detailCalonPemilik['perumahan'] = MasterPerumahan::find($detailCalonPemilik->rumah_id)->nama_perumahan;
        $detailCalonPemilik['tipe_rumah'] = TipePerumahan::find($detailCalonPemilik->tipe_perumahan_id)->nama_tipe;

        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => 'Calon pemilik ditemukan!',
            'result' => $detailCalonPemilik
        ], 200);
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
