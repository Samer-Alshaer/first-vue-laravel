<?php

namespace App\Http\Controllers;

use App\Models\book;
use App\Models\student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class BookController extends Controller
{

    public function getBook($id)
    {
        $book = book::all()->where('student_id', $id);
        if ($book) {
            return  ['status' => "success", 'data' => $book];
        } else {
            return  ['status' => "error", 'msg' => 'No Books !'];
        }
    }
    public function addBook(Request $req)
    {
        $fields = Validator::make($req->all(), [
            'title' => 'required|string',
            'description' => 'required|string',
            'img' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);
        if ($fields->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $fields->errors()
            ], 401);
        }
        $input = $req->all();
        if ($image = $req->file('img')) {
            $image = $req->file('img');
            $destinationPath = public_path('Uploads/Books');
            $image_name = time() . '.' . $image->getClientOriginalName();
            $image->move($destinationPath, $image_name);
            $input['img'] = $image_name;
        }
        $input['student_id'] = $req->student_id;
        $result = book::create($input);
        if ($result) {
            return response()->json([
                'status' => "success",
                'Msg' => "Book Added Successfully !"
            ]);
        } else {
            return response()->json([
                'status' => "error",
                'Msg' => "Ops, Book Not Added"
            ]);
        }
    }

    public function deleteBook($id)
    {
        $book = book::find($id);
        $result =  $book->delete();
        $path = 'Uploads/Books/' . $book->img;
        if (File::exists($path)) {
            File::delete($path);
        }
        if ($result)
            return ['Msg' => "Book  Deleted Successfully !", 'status' => "success"];
        else
            return ['Msg' => "Ops, Book Not Deleted"];
    }
}
