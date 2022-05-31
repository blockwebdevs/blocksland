<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Tag;

class TagsController extends Controller
{
    public function index($slug)
    {

        $tag = Tag::with('translations')
            ->whereHas('translations', function ($query) use ($slug) {
                $query->where('slug', $slug);
            })->firstOrFail();

        $products = Product::where('active', 1)->where('tag_id', $tag->id)->orderBy('position', 'asc')->paginate(30);

        $seoData = $this->getSeo($tag);
        $languagesUrls = $this->getLanguageUrls($tag);

        return view('front.tags.item', compact('products', 'tag', 'seoData', 'languagesUrls'));
    }

    private function getSeo($page)
    {
        $seo['title'] =  $page->translation($this->lang->id)->first()->meta_title ?? $this->title . $page->translation($this->lang->id)->first()->title;
        $seo['keywords'] = $page->translation($this->lang->id)->first()->meta_keywords ?? $page->translation($this->lang->id)->first()->title;
        $seo['description'] = $page->translation($this->lang->id)->first()->meta_description ?? $page->translation($this->lang->id)->first()->title;

        return $seo;
    }

    private function getLanguageUrls($page)
    {
        $urls = [];
        foreach ($page->translations as $translation) {
            $urls[$translation->lang->lang] = '/' . $translation->lang->lang . '/tag/' . $translation->slug;
        }
        return $urls;
    }
}
