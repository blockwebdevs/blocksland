<?php

namespace App\Http\Controllers;

use App\Models\Blog;

class BlogController extends Controller
{
    public function renderPost($slug)
    {
        $post = Blog::with('translations')
            ->whereHas('translations', function ($query) use ($slug) {
                $query->where('slug', $slug);
            })->firstOrFail();

        $similarPosts = Blog::with('translations')
            ->inRandomOrder()
            ->where('id', '!=', $post->id)
            ->limit(10)
            ->where('active', 1)->get();

        $seoData = $this->getPostSeo($post);
        $languagesUrls = $this->getLanguageUrls($post);

        return view('front.blog.post', compact( 'similarPosts', 'post', 'seoData', 'languagesUrls'));
    }

    private function getPostSeo($post)
    {
        $seo['title'] =  $post->translation->seo_title ?? $this->title . $post->translation->name;
        $seo['keywords'] = $post->translation->seo_keywords ?? $post->translation->name;
        $seo['description'] = $post->translation->seo_description ?? $post->translation->name;

        return $seo;
    }

    private function getLanguageUrls($page)
    {
        $urls = [];

        foreach ($page->translations as $translation) {
            $urls[$translation->lang->lang] = '/' . $translation->lang->lang . '/blog/' . $translation->slug;
        }

        return $urls;
    }
}
