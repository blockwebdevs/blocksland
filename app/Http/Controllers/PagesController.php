<?php

namespace App\Http\Controllers;

use App\Models\Agent;
use App\Models\Blog;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\Testimonial;
use App\Models\Page;
use Session;

class PagesController extends Controller
{
    public $title = 'Blocks land | ';

    public function index()
    {
        $page = Page::where('alias', 'home')->firstOrFail();
        $seoData = $this->getSeo($page);

        $testimonials = Testimonial::orderBy('position', 'asc')->limit(3)->get();
        $categories = ProductCategory::where('active', 1)->orderBy('position', 'asc')->limit(3)->get();
        $recommendedProducts = Product::where('active', 1)
            ->where('recommended', 1)
            ->orderBy('category_id', 'asc')
            ->orderBy('position', 'asc')
            ->limit(21)
            ->get();

        return view('front.home', compact('page','recommendedProducts', 'categories', 'testimonials', 'seoData'));
    }

    public function renderBlog()
    {
        $page = Page::where('alias', 'blog')->firstOrFail();
        $seoData = $this->getSeo($page);
        $languagesUrls = $this->getLanguageUrls($page);
        $posts = Blog::where('active', 1)
            ->orderBy('date_time', 'desc')
            ->orderBy('position', 'asc')
            ->paginate(20);

        return view('front.blog.list', compact('posts','seoData', 'languagesUrls'));
    }

    public function renderPage($slug)
    {
        $testimonialsAll = Testimonial::orderBy('position', 'asc')->get();
        $testimonials = Testimonial::orderBy('position', 'asc')->limit(3)->get();

        $agents = Agent::orderBy('job', 'desc')->get();

        $page = Page::with('translations')->where('active', 1)
            ->whereHas('translations', function ($query) use ($slug) {
                $query->where('slug', $slug);
            })->firstOrFail();

        $seoData = $this->getSeo($page);
        $languagesUrls = $this->getLanguageUrls($page);

        if (view()->exists('front.pages.'.$page->alias)) {
            return view('front.pages.'.$page->alias, compact('agents','testimonials','testimonialsAll','page','seoData', 'languagesUrls'));
        }

        return view('front.pages.default', compact('page','seoData', 'languagesUrls'));
    }

    public function get404()
    {
        return view('front_old.404');
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
            $urls[$translation->lang->lang] = '/' . $translation->lang->lang . '/' . $translation->slug;
        }

        return $urls;
    }
}
