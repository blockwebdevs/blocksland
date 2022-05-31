<?php

namespace App\Models;

use App\Base as Model;

class Testimonial extends Model
{
    protected $table = 'testimonials';

    protected $fillable = ['title', 'body', 'author', 'position'];
}
