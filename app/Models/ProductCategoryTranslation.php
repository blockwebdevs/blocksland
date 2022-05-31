<?php

namespace App\Models;

use App\Base as Model;

class ProductCategoryTranslation extends Model
{
    protected $table = 'product_categories_translation';

    protected $fillable = [
        'lang_id',
        'product_category_id',
        'name',
        'slug',
        'description',
        'seo_text',
        'seo_title',
        'seo_description',
        'seo_keywords'
    ];

    public function category()
    {
        return $this->belongsTo(ProductCategory::class);
    }

    public function lang()
    {
        return $this->belongsTo(Lang::class);
    }
}
