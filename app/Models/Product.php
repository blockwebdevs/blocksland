<?php

namespace App\Models;

use App\Base as Model;

class Product extends Model
{
    protected $fillable = [
        'category_id',
        'tag_id',
        'agent_id',
        'alias',
        'code',
        'price',
        'surface',
        'position',
        'active',
        'recommended',
        'iframe',
    ];

    public function scopeFilterPrice($query, $price)
    {
        if ($price) {
            $priceMin = $price['min'] ?? $this->min('price');
            $priceMax = $price['max'] ?? $this->max('price');

            $query->whereBetween('price', [(float)$priceMin, (float)$priceMax]);
        }
    }

    public function scopeFilterSurface($query, $surface)
    {
        if ($surface) {
            $surfaceMin = $surface['min'] ?? $this->min('surface');
            $surfaceMax = $surface['max'] ?? $this->max('surface');

            $query->whereBetween('surface', [(float)$surfaceMin, (float)$surfaceMax]);
        }
    }

    public function scopePriceFilter($query, $price)
    {
        $priceFrom = (int)$price - ((int)$price * 0.25);
        $priceTo = (int)$price + ((int)$price * 0.25);

        $query->whereBetween('price', [(int)$priceFrom, (int)$priceTo]);
    }

    public function translations()
    {
        return $this->hasMany(ProductTranslation::class);
    }

    public function translation()
    {
        return $this->hasOne(ProductTranslation::class)->where('lang_id', self::$lang);
    }

    public function translationByLang($lang)
    {
        return $this->hasOne(ProductTranslation::class)->where('lang_id', $lang)->first();
    }

    public function category()
    {
        return $this->hasOne(ProductCategory::class, 'id', 'category_id');
    }

    public function mainImage()
    {
        return $this->hasOne(ProductImage::class, 'product_id')->where('main', 1)->orderBy('main', 'desc');
    }

    public function agent()
    {
        return $this->belongsTo(Agent::class);
    }

    public function images()
    {
        return $this->hasMany(ProductImage::class, 'product_id')
            ->orderBy('main', 'desc')
            ->orderBy('href', 'asc')
            ->where('deleted', 0)
            ->where('type', null);
    }

    public function getParameterValue($parameterId)
    {
        return $this->hasOne(ParameterValueProduct::class)->where('parameter_id', $parameterId);
    }
}
