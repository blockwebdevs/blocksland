<?php

namespace App\Models;

use App\Base as Model;

class BlogTranslation extends Model
{
    protected $table = 'blogs_translation';

    protected $fillable = [
        'lang_id',
        'blog_id',
        'name',
        'slug',
        'description',
        'body',
        'alias',
        'banner',
        'seo_text',
        'seo_title',
        'seo_keywords',
        'seo_description',
    ];

    public function lang()
    {
        return $this->belongsTo(Lang::class);
    }
}
