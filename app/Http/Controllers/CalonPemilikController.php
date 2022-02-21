<?php

namespace App\Http\Controllers;

use App\Models\CalonPemilik;
use App\Models\Konsumen;
use App\Models\MasterPerumahan;
use App\Models\Perumahan;
use App\Models\StatusPengajuan;
use App\Models\TipePerumahan;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CalonPemilikController extends Controller
{
    public function getCalonPemilikAll() {
        $listCalonPemilik = CalonPemilik::all()->sortByDesc('id');
        return $this->convertCalonPemilikToResponse($listCalonPemilik);
    }

    public function getCalonPemilikAllById($id) {
        $listCalonPemilik = CalonPemilik::all()->where('konsumen_id', '=', $id)->sortByDesc('id');
        return $this->convertCalonPemilikToResponse($listCalonPemilik);
    }

    public function getCalonPemilik($id)
    {
        $detailCalonPemilik = CalonPemilik::find($id);

        if (!$detailCalonPemilik) {
            return response()->json([
                'code' => 404,
                'status' => "Not Found",
                'message' => 'Detail Calon pemilik tidak ditemukan!',
                'result' => ''
            ], 404);
        }

        $konsumen = Konsumen::find($detailCalonPemilik->konsumen_id);

        $detailCalonPemilik['konsumen_nama'] = $konsumen->nama_lengkap;
        $detailCalonPemilik['konsumen_alamat'] = $konsumen->alamat;
        $detailCalonPemilik['konsumen_no_hp'] = $konsumen->no_hp;
        $detailCalonPemilik['konsumen_email'] = $konsumen->email;
        $detailCalonPemilik['perumahan'] = MasterPerumahan::find($detailCalonPemilik->rumah_id)->nama_perumahan;
        $detailCalonPemilik['tipe_rumah'] = TipePerumahan::find($detailCalonPemilik->tipe_perumahan_id)->nama_tipe;
        $detailCalonPemilik['status_pengajuan'] = StatusPengajuan::find($detailCalonPemilik->status_pengajuan_id)->nama;

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
            'tipe_perumahan_id' => 'required',
            'rumah_id' => 'required',
            'jumlah_dp' => 'required',
            'bukti_transfer' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            'dokumen_pengajuan' => 'required|image|mimes:jpeg,png,jpg|max:2048'
        ]);

        $buktiDP = $request->file('bukti_transfer');
        $dokumenPengajuan = $request->file('dokumen_pengajuan');

        $namaBuktiDP = time() . '_' . $buktiDP->getClientOriginalName();
        $namaDokumenPengajuan = time() . '_' . $dokumenPengajuan->getClientOriginalName();

        $calonPemilik = CalonPemilik::create([
            'konsumen_id' => $request->konsumen_id,
            'tipe_perumahan_id' => $request->tipe_perumahan_id,
            'rumah_id' => $request->rumah_id,
            'status_pengajuan_id' => 1,
            'jumlah_dp' => $request->jumlah_dp,
            'bukti_transfer' => $namaBuktiDP,
            'dokumen_pengajuan' => $namaDokumenPengajuan
        ]);

        if ($calonPemilik) {

            $buktiDP->move('bukti transfer', $namaBuktiDP);
            $dokumenPengajuan->move('dokumen pengajuan', $namaDokumenPengajuan);

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
        $this->validate($request, [
            'status_pengajuan_id' => 'required'
        ]);

        $calonPemilik = CalonPemilik::find($request->id);

        if ($calonPemilik) {
            $calonPemilik->status_pengajuan_id = $request->status_pengajuan_id;
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

    public function getCalonPemilikAllByRangeDate($start, $end)
    {
        $listCalonPemilik = CalonPemilik::all()
            ->sortByDesc('id')
            ->whereBetween('tanggal_pengajuan', [$start, $end]);
        $data = [];

        foreach ($listCalonPemilik as $calonPemilik) {
            $konsumen = Konsumen::find($calonPemilik->konsumen_id);
            $calonPemilikItem['id'] = $calonPemilik->id;
            $calonPemilikItem['nama'] = $konsumen->nama_lengkap;
            $calonPemilikItem['alamat'] = $konsumen->alamat;
            $calonPemilikItem['perumahan'] = Perumahan::find($calonPemilik->rumah_id)->nama_perumahan;
            $calonPemilikItem['tipe_rumah'] = TipePerumahan::find($calonPemilik->tipe_perumahan_id)->nama_tipe;
            $calonPemilikItem['status_pengajuan'] = StatusPengajuan::find($calonPemilik->status_pengajuan_id)->nama;
            $calonPemilikItem['tanggal_pengajuan'] = $calonPemilik->tanggal_pengajuan;
            $data[] = $calonPemilikItem;
        }

        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "SUCCESS",
            'result' => $data
        ]);
    }

    /**
     * @param $listCalonPemilik
     * @return JsonResponse
     */
    private function convertCalonPemilikToResponse($listCalonPemilik): JsonResponse
    {
        $data = [];

        foreach ($listCalonPemilik as $calonPemilik) {
            $konsumen = Konsumen::find($calonPemilik->konsumen_id);
            $calonPemilikItem['id'] = $calonPemilik->id;
            $calonPemilikItem['nama'] = $konsumen->nama_lengkap;
            $calonPemilikItem['alamat'] = $konsumen->alamat;
            $calonPemilikItem['tipe_rumah'] = TipePerumahan::find($calonPemilik->tipe_perumahan_id)->nama_tipe;
            $calonPemilikItem['status_pengajuan'] = StatusPengajuan::find($calonPemilik->status_pengajuan_id)->nama;
            $data[] = $calonPemilikItem;
        }

        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "SUCCESS",
            'result' => $data
        ]);
    }
}
