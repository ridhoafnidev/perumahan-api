<?php

namespace App\Http\Controllers;

use App\Models\FotoTipeRumah;
use App\Models\MasterPerumahan;
use App\Models\TipePerumahan;

class TipeRumahController extends Controller
{
    //region ambil semua data tipe rumah

    public function getTipeRumahAll() {
        $tipeRumah = TipePerumahan::all();
        $data = array();
        foreach ($tipeRumah as $item) {
            $arrayTipeRumah['id'] = $item['id'];
            $arrayTipeRumah['nama_tipe'] = $item['nama_tipe'];
            $arrayTipeRumah['ukuran'] = $item['ukuran'];
            $arrayTipeRumah['pondasi'] = $item['pondasi'];
            $arrayTipeRumah['dinding'] = $item['dinding'];
            $arrayTipeRumah['lantai'] = $item['lantai'];
            $arrayTipeRumah['plafon'] = $item['plafon'];
            $arrayTipeRumah['pintu_depan'] = $item['pintu_depan'];
            $arrayTipeRumah['dinding_km'] = $item['dinding_km'];
            $arrayTipeRumah['kusen'] = $item['kusen'];
            $arrayTipeRumah['r_atap'] = $item['r_atap'];
            $arrayTipeRumah['p_atap'] = $item['p_atap'];
            $arrayTipeRumah['sanitasi'] = $item['sanitasi'];
            $arrayTipeRumah['listrik'] = $item['listrik'];
            $arrayTipeRumah['air'] = $item['air'];
            $arrayTipeRumah['harga'] = $item['harga'];
            $arrayTipeRumah['jumlah_unit'] = $item['jumlah_unit'];
            $arrayTipeRumah['perumahan_id'] = $item['perumahan_id'];
            $arrayTipeRumah['perumahan'] = $this->getPerumahansById($item['id']);
            $arrayTipeRumah['foto'] = $this->getFotosById($item['id']);
            $data[] = $arrayTipeRumah;
        }

        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "SUCCESS",
            'result' => $data
        ], 200);
    }

    //endregion
    //region ambil data tipe rumah by id

    public function getTipeRumahById($id) {
        $detailTipeRumah = TipePerumahan::find($id);
        if (!$detailTipeRumah) {
            return response()->json([
                'code' => 404,
                'status' => "Not Found",
                'message' => 'Detail Calon pemilik tidak ditemukan!',
                'result' => ''
            ], 404);
        }
        $detailTipeRumah['perumahan'] = $this->getPerumahansById($id);
        $detailTipeRumah['foto'] = $this->getFotosById($id);
        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "Success",
            'result' => $detailTipeRumah
        ]);
    }

    //endregion
    //region additional function

    private function getFotosById($id)
    {
        return FotoTipeRumah::where('tipe_rumah_id', $id)->get();
    }

    private function getPerumahansById($perumahan_id)
    {
        return MasterPerumahan::where('tipe_perumahan_id', $perumahan_id)->get();
    }

    //endregion

    public function getTipeRumahOnly() {
        $tipeRumah = TipePerumahan::all();
        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "SUCCESS",
            'result' => $tipeRumah
        ], 200);
    }
}
