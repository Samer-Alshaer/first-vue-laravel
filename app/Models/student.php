<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class student extends Model
{
    use HasFactory;
    protected $table = 'students';
    protected $fillable = ['name', 'age', 'img', 'adate'];

    public function book()
    {
        return $this->belongsTo(book::class, 'student_id', 'id');
    }
}
