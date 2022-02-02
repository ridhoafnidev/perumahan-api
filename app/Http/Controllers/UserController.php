<?php

namespace App\Http\Controllers;

use App\Models\Konsumen;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function register(Request $request)
    {
        $this->validate($request, [
            'username' => 'required|unique:tb_user',
            'password' => 'required|min:6',
            'nama_lengkap' => 'required',
            'alamat' => 'required',
            'no_hp' => 'required',
            'email' => 'required|unique::tb_konsumen'
        ]);

        $username = $request->input('username');
        $password = Hash::make($request->input('password'));

        if ($this->checkUsername($username) == 1) {
            return response()->json([
                'code' => 200,
                'status' => "Failed",
                'message' => 'Username sudah ada!',
                'result' => ''
            ], 500);
        }
        else {
            $user = User::create([
                'username' => $username,
                'password' => $password
            ]);

            if ($user) {

                $konsumen = Konsumen::create([
                    'user_id' => $user->id,
                    'nama_lengkap' => $request->nama_lengkap,
                    'alamat' => $request->alamat,
                    'no_hp' => $request->no_hp,
                    'email' => $request->email
                ]);

                if ($konsumen) {
                    return response()->json([
                        'code' => 200,
                        'status' => "Success",
                        'message' => 'SUCCESS',
                        'result' => ''
                    ], 200);
                }
                else {
                    return response()->json([
                        'code' => 200,
                        'status' => "Failed",
                        'message' => 'FAILED',
                        'result' => ''
                    ], 500);
                }
            }
            else {
                return response()->json([
                    'code' => 200,
                    'status' => "Failed",
                    'message' => 'FAILED',
                    'result' => ''
                ], 500);
            }
        }
    }

    public function login(Request $request){
        $this->validate($request, [
            'username' => 'required',
            'password' => 'required|min:6'
        ]);

        $username = $request->input('username');
        $password = $request->input('password');

        $user = User::where('username', $username)->first();
        $role = $user->role;
        if ($role == "direktur"){
            $dataUser = User::join('tb_direktur', 'tb_user.id', '=', 'tb_direktur.user_id')
                ->where('tb_user.username', $username)
                ->where('tb_user.role', 'direktur')
                ->get(['tb_user.*', 'tb_direktur.*', 'tb_direktur.id as direktur_id']);
        }
        elseif ($role == "konsumen") {
            $dataUser = User::join('tb_konsumen', 'tb_user.id', '=', 'tb_konsumen.user_id')
                ->where('tb_user.username', $username)
                ->where('tb_user.role', 'konsumen')
                ->get(['tb_user.*', 'tb_konsumen.*', 'tb_konsumen.id as konsumen_id']);
        }
        elseif($role == "pegawai") {
            $dataUser = User::join('tb_pegawai', 'tb_user.id', '=', 'tb_pegawai.user_id')
                ->where('tb_user.username', $username)
                ->where('tb_user.role', 'pegawai')
                ->get(['tb_user.*', 'tb_pegawai.*', 'tb_pegawai.id as pegawai_id']);
        }

        if (!$user){
            return response()->json([
                'code' => 200,
                'status' => "Failed",
                'message' => 'FAILED',
                'result' => ''
            ], 500);
        }

        $isValidPassword = Hash::check($password, $user->password);

        if (!$isValidPassword){
            return response()->json([
                'code' => 200,
                'status' => "Failed",
                'message' => 'FAILED',
                'result' => ''
            ], 500);
        }

        return response()->json([
            'code' => 200,
            'status' => "Success",
            'message' => 'SUCCESS',
            'result' => $dataUser
        ], 200);

    }

    public function checkUsername($username){
        $checkUsername = User::where('username', $username)->count();
        if ($checkUsername > 0){
            return 1;
        }
        else {
            return 0;
        }
    }

}
