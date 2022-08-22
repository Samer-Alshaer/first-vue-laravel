<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use App\Models\student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Exception;

class StudentController extends Controller
{
    /* -------------------------------- Get Student ------------------------------------- */
    public function getstudents($id)
    {
        $Student = student::find($id);
        if ($Student) {
            return response()->json([
                'status' => 'success',
                'data' => $Student
            ]);
        }
    }

    /* -------------------------------- Add Student ------------------------------------- */
    function addstudent(Request $req)
    {
        $fields = Validator::make($req->all(), [
            'name' => 'required|string',
            'age' => 'required|string',
            'img' => 'required|image|mimes:jpeg,png,jpg,gif,svg'
        ]);
        if ($fields->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $fields->errors()
            ],401);
        }

        $input = $req->all();
        if ($image = $req->file('img')) {
            $image = $req->file('img');
            $destinationPath = public_path('Uploads');
            $image_name = time() . '.' . $image->getClientOriginalName();
            $image->move($destinationPath, $image_name);
            $input['img'] = $image_name;
        }
        $result = student::create($input);
        if ($result) {
            return ['Msg' => "Student Added Successfully !", 'status' => "success"];
        } else {
            return  ['Msg' => "Ops, Student Not Added", 'status' => 401];
        }
    }

    /* -------------------------------- Edit Student ------------------------------------- */
    function editstudent(Request $req)
    {
        $student = student::find($req->id);
        $student->name = $req->name;
        $student->age = $req->age;

        if ($req->hasFile("img")) {
            $image = $req->file('img');
            $image_name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = 'Uploads';
            $image->move($destinationPath, $image_name);
            $student->img = "$image_name";

            $path = $student->img;
            $image_path = public_path("/Uploads/" . $path);
        }
        // if (File::exists($image_path)) {
        //     unlink($image_path);
        // }
        $result = $student->save();
        // if (File::exists($image_path)) {
        //     File::delete($image_path);
        // }

        if ($result) {
            return response()->json([
                'status' => 'success',
                'msg' => 'Student Updated Successfully !'
            ]);
        } else {
            return  "Ops, Student Not Updated";
        }
    }

    /* -------------------------------- Delete Student ------------------------------------- */
    function deletestudent($id)
    {
        $student = student::find($id);
        $result =  $student->delete();
        $path = 'Uploads/' . $student->img;
        if (File::exists($path)) {
            File::delete($path);
        }
        if ($result)
            return ['Msg' => "Student  Deleted Successfully !"];
        else
            return ['Msg' => "Ops, Student Not Deleted"];
    }

    /* ------------------------------------ Search About Student--------------------------------- */
    function search()
    {
        return student::when(request('search'), function ($query) {
            $query->where('name', 'LIKE', '%' . request('search') . '%')
                ->orWhere('age', 'LIKE', '%' . request('search') . '%');
        })->orderBy('id')->paginate(3);
    }
}
