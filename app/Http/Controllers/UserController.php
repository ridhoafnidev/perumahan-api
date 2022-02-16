<?php

namespace App\Http\Controllers;

use App\Models\Direktur;
use App\Models\Konsumen;
use App\Models\Pegawai;
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
            'email' => 'required|email|unique:tb_konsumen',
            'role' => 'required'
        ]);

        $username = $request->input('username');
        $password = Hash::make($request->input('password'));

        if ($this->checkUsername($username) == 1) {
            return response()->json([
                'code' => 400,
                'status' => "Failed",
                'message' => 'Username sudah ada!',
                'result' => ''
            ], 400);
        }
        else {
            $role = $request->role;

            $user = User::create([
                'username' => $username,
                'password' => $password,
                'role' => $role
            ]);

            if ($user) {
                $userId = $user->id;
                $namaLengkap = $request->nama_lengkap;
                $alamat = $request->alamat;
                $noHp = $request->no_hp;
                $email = $request->email;

                switch ($role) {
                    case 'direktur':
                        Direktur::create([
                            'user_id' => $userId,
                            'nama_lengkap' => $namaLengkap,
                            'alamat' => $alamat,
                            'no_hp' => $noHp,
                            'email' => $email
                        ]);
                        break;
                    case 'pegawai':
                        Pegawai::create([
                            'user_id' => $userId,
                            'nama_lengkap' => $namaLengkap,
                            'alamat' => $alamat,
                            'no_hp' => $noHp,
                            'email' => $email
                        ]);
                        break;
                    default:
                        Konsumen::create([
                            'user_id' => $userId,
                            'nama_lengkap' => $namaLengkap,
                            'alamat' => $alamat,
                            'no_hp' => $noHp,
                            'email' => $email
                        ]);
                }
                return response()->json([
                    'code' => 200,
                    'status' => "Success",
                    'message' => 'SUCCESS',
                    'result' => ''
                ]);
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

        if ($user == null) {
            return response()->json([
                'code' => 404,
                'status' => "Not Found",
                'message' => 'User tidak ditemukan!',
                'result' => ''
            ], 404);
        }

        $role = $user->role;

        if ($role == "direktur"){
            $dataUser = User::join('tb_direktur', 'tb_user.id', '=', 'tb_direktur.user_id')
                ->where('tb_user.username', $username)
                ->where('tb_user.role', 'direktur')
                ->get(['tb_user.*', 'tb_direktur.*', 'tb_direktur.id as direktur_id'])
                ->first();
        }
        elseif ($role == "konsumen") {
            $dataUser = User::join('tb_konsumen', 'tb_user.id', '=', 'tb_konsumen.user_id')
                ->where('tb_user.username', $username)
                ->where('tb_user.role', 'konsumen')
                ->get(['tb_user.*', 'tb_konsumen.*', 'tb_konsumen.id as konsumen_id'])
                ->first();
        }
        elseif($role == "pegawai") {
            $dataUser = User::join('tb_pegawai', 'tb_user.id', '=', 'tb_pegawai.user_id')
                ->where('tb_user.username', $username)
                ->where('tb_user.role', 'pegawai')
                ->get(['tb_user.*', 'tb_pegawai.*', 'tb_pegawai.id as pegawai_id'])
                ->first();
        }

        if (!$user){
            return response()->json([
                'code' => 500,
                'status' => "Failed",
                'message' => 'FAILED',
                'result' => ''
            ], 500);
        }

        $isValidPassword = Hash::check($password, $user->password);

        if (!$isValidPassword){
            return response()->json([
                'code' => 500,
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
