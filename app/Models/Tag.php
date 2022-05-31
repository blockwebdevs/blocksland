<?php

namespace App\Models;

use App\Base as Model;

class Tag extends Model
{
    protected $table = 'tags';

    protected $fillable = ['image', 'position'];

    public function translations()
    {
        return $this->hasMany(TagTranslation::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'tag_id', 'id');
    }

    public function translation()
    {
        return $this->hasOne(TagTranslation::class , 'tag_id')->where('lang_id', self::$lang);
    }
}
