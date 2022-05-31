<?php

namespace App\Models;

use App\Base as Model;

class TagTranslation extends Model
{
    protected $table = 'tags_translation';

    protected $fillable = ['lang_id', 'tag_id', 'name', 'slug', 'seo_text', 'seo_title', 'seo_keywords', 'seo_description', 'seo_text'];

    public function tag()
    {
        return $this->belongsTo(Tag::class);
    }

    public function lang()
    {
        return $this->belongsTo(Lang::class);
    }
}
