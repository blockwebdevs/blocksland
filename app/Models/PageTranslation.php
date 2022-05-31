<?php

namespace App\Models;

use App\Base as Model;

class PageTranslation extends Model
{
    protected $table = 'pages_translation';

    protected $fillable = [
        'page_id',
        'lang_id',
        'title',
        'slug',
        'description',
        'body',
        'image',
        'meta_title',
        'meta_description',
        'meta_keywords',
    ];

    public function page()
    {
        return $this->belongsTo(Page::class);
    }

    public function lang()
    {
        return $this->belongsTo(Lang::class);
    }
}
