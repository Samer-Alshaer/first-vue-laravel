<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class UserController extends Controller
{
    public function register(Request $req)
    {
        $fields = Validator::make($req->all(), [
            'username' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:5'
        ]);
        if ($fields->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $fields->errors()
            ]);
        }
        $user = new User;
        $user->name = 'username';
        $user->email = 'email';
        $user->password = bcrypt(['password']);
          
        $user->save();
        $token = $user->createToken('my-app-token')->plainTextToken;
        return response()->json([
            'status' => 'success',
            'message' => 'Registered successfully !',
            "data" => [
                'user' => $user,
                'token' => $token,
                'status' => 200
            ]
        ]);
    }


    public function login(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:5',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $validator->errors()
            ]);
        }
        if (!$token = auth()->attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        return response()->json([
            'status' => 'success',
            'message' => 'Login successfully !',
            "data" => [
                'token' => $token,
                'status' => "success"
            ]
        ]);
    }

    public function logout()
    {
        auth()->logout();
        return response()->json(['message' => 'logged out Successfully !', 'status' => 200]);
    }
}
