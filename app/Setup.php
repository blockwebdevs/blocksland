<?php

namespace App;

use App\Base as Model;
use App\Models\Lang;
use App\Models\ProductCategory;
use App\Models\Page;
use App\Models\Module;
use App\Models\Tag;
use App\Models\SimilarProducts;
use Illuminate\Support\Facades\View;

class Setup
{
    private $request;
    public static $setup = false;
    public static $lang;
    public static $langs;
    public static $seoData;

    public function __construct($request)
    {
        $this->request = $request;
        self::$seoData = $this->setSeoData();
        self::$lang = Lang::where('default', 1)->first();

        $this->setLang($request);

        if (\Request::segment(1) == 'back') {
            View::share('menu', Module::where('parent_id', 0)->orderBy('position')->get());
        }
    }

    public function init()
    {
        $categories = ProductCategory::where('active', 1)->orderBy('position', 'asc')->get();
        $headerMenus = Page::where('active', 1)->where('on_header', 1)->orderBy('position', 'asc')->get();
        $footerMenus = Page::where('active', 1)->where('on_footer', 1)->orderBy('position', 'asc')->get();
        $policiesMenus = Page::where('active', 1)->where('alias', 'policies')->orderBy('position', 'asc')->get();
        $tags = Tag::orderBy('position', 'asc')->get();
        $testimonialsPage = Page::where('alias', 'testimonials')->first();

        $languagesUrls = ['ro' => '/ro', 'ru' => '/ru', 'en' => '/en'];

        View::share("agentEmail", false);
        View::share("testimonialsPage", $testimonialsPage);
        View::share("languagesUrls", $languagesUrls);
        View::share("tags", $tags);
        View::share("policiesMenus", $policiesMenus);
        View::share("footerMenus", $footerMenus);
        View::share("headerMenus", $headerMenus);
        View::share("categories", $categories);
        View::share("lang", self::$lang);
        View::share("langs", self::$langs);

        Model::$lang = self::$lang->id;

        if ($this->request->method() == 'GET') {
            View::share("seoData", self::$seoData);

            if ($this->request->method() == 'GET') {
                $this->shareMenus();
                $this->shareContacts();
            }
        }

        if (!isset($_COOKIE['user_id'])){
            $userCookie = rand(100, 100000);
            setcookie('user_id', $userCookie, time() + 10000000, '/');
        } else {
            $userCookie = $_COOKIE['user_id'];
        }

        SimilarProducts::create([
            'user_id' => $userCookie,
            'path' => url()->current(),
            'date' => date('h:i:s Y-m-d'),
            'device' => isMobile() ? 'mobile' : 'desktop',
        ]);
    }

    private function shareContacts()
    {
        View::share('globalPhone', '37379000000');
        View::share('globalTelegram', 'blockslandonline');
        View::share('globalEmail', 'blockslandonline@gmail.com');
        View::share('globalFacebook', 'https://www.facebook.com');
        View::share('globalInstagram', 'https://www.instagram.com');
        View::share('globalYoutube', 'https://www.youtube.com');
    }

    private function shareMenus()
    {
        $categoriesMenuLoungewear = ProductCategory::where('parent_id', 0)->where('active', 1)->orderBy('position', 'asc')->get();
        View::share('categoriesMenuLoungewear', $categoriesMenuLoungewear);
    }

    private function setSeoData()
    {
        $seo['title'] = env('SEO_TITLE');
        $seo['keywords'] = env('SEO_KEYWORDS');
        $seo['description'] = env('SEO_DESCRIPTION');

        return $seo;
    }

    private function setLang($request)
    {
        if ($request->segment(1)) {
            $lang = Lang::where('lang', $request->segment(1))->first();
            if (!is_null($lang)) self::$lang = $lang;
        } else {
            self::$lang = Lang::where('default', 1)->first();
        }

        self::$langs = Lang::get();
        setcookie('lang_id', self::$lang->lang, time() + 10000000, '/');
        session(['applocale' => self::$lang->lang]);
        \App::setLocale(self::$lang->lang);
    }
}
