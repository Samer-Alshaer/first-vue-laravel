<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class book extends Model
{
    use HasFactory;
    protected $table = 'books';
    protected $fillable = ['title', 'description', 'img', 'student_id'];

    public function students()
    {
        return $this->hasMany(student::class, 'student_id', 'id');
    }
}
