<?php

namespace App\Models;

use App\Base as Model;

class SimilarProducts extends Model
{
    protected $table = 'similar_products';

    protected $fillable = ['product_id', 'category_id', 'user_id', 'path', 'date', 'device'];
}
