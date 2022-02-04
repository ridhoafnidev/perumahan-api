<?php

namespace App\Http\Controllers;

use App\Models\CalonPemilik;

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
}
