<?php

namespace App\Http\Controllers;

use App\Models\Perumahan;
use Illuminate\Http\Request;

class PerumahanController extends Controller
{
    public function getPerumahanById($tipePerumahanId)
    {
        $perumahan = Perumahan::all()
            ->where('tipe_perumahan_id', '=', $tipePerumahanId);

        if (!$perumahan) {
            return response()->json([
                'code' => 404,
                'status' => "Not Found",
                'message' => 'Perumahan tidak ditemukan!',
                'result' => ''
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => "Success",
            'result' => $perumahan
        ]);
    }
}
