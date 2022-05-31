<?php

function getFounderPhoto()
{
    $page = \App\Models\Page::select('image')->where('alias', 'home')->first();
    if ($page) {
        return $page->image;
    }
    return null;
}

function isMobile()
{
    if (isset($_SERVER['HTTP_USER_AGENT'])) {
        return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|tablet|up\.browser|up\.link|webos|wos)/i", $_SERVER["HTTP_USER_AGENT"]);
    }
    return false;
}

function getProductRooms($product)
{
    $parameter = $product->getParameterValue(2)->first();
    if ($parameter) {
        $value = $product->getParameterValue(2)->first()->value;
        if ($value) {
            $translation = $product->getParameterValue(2)->first()->value->translation;
            if ($translation) {
                return $product->getParameterValue(2)->first()->value->translation->name;
            }
        }
    }

    return false;
}

function GetTranslations($lang)
{
    $array = [];
    $groups = \App\Models\TranslationGroup::get();
    $lang = \App\Models\Lang::select('id')->where('lang', $lang)->first();

    if (!is_null($lang)) {
        if (count($groups) > 0) {
            foreach ($groups as $key => $group) {
                if (count($group->translations) > 0) {
                    foreach ($group->translations as $key => $trans) {
                        if (!is_null($trans->linesByLang($lang->id)->first())) {
                            $array[$group->key][$trans->key] = $trans->linesByLang($lang->id)->first()->line;
                        }
                    }
                }
            }
        }
    }

    return $array;
}

function hasSubmodule($id)
{
    $table = "modules";

    $row = DB::table($table)
        ->where('parent_id', $id)
        ->get();

    return $row;
}

function moduleItems($table)
{
    if (Schema::hasTable($table)) {
        $row = DB::table($table)
            ->select('id')
            ->get();

        return $row->count();
    }
    return false;

}

function SelectProdsCatsTree($lang_id, $id)
{
    $categories = DB::table('product_categories_translation')
        ->join('product_categories', 'product_categories_translation.product_category_id', '=', 'product_categories.id')
        ->where('parent_id', $id)
        ->where('lang_id', $lang_id)
        ->orderBy('position', 'asc')
        ->get();

    return $categories ?? null;
}
