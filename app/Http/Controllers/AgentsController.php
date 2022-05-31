<?php

namespace App\Http\Controllers;

use App\Models\Agent;
use App\Models\Page;
use App\Models\Product;

class AgentsController extends Controller
{
    public function index($id)
    {
        $page = Page::where('alias', 'team')->firstOrFail();
        $agent = Agent::where('id', $id)->firstOrFail();

        $products = Product::where('active', 1)->where('agent_id', $agent->id)->orderBy('position', 'asc')->paginate(20);

        $seoData = $this->getSeo($page);
        $languagesUrls = $this->getLanguageUrls($agent);

        return view('front.agents.agent', compact('products', 'agent', 'seoData', 'languagesUrls'));
    }

    private function getSeo($page)
    {
        $seo['title'] =  $page->translation($this->lang->id)->first()->meta_title ?? $this->title . $page->translation($this->lang->id)->first()->title;
        $seo['keywords'] = $page->translation($this->lang->id)->first()->meta_keywords ?? $page->translation($this->lang->id)->first()->title;
        $seo['description'] = $page->translation($this->lang->id)->first()->meta_description ?? $page->translation($this->lang->id)->first()->title;

        return $seo;
    }

    private function getLanguageUrls($agent)
    {
        $urls = [];
        foreach ($this->langs as $lang) {
            $urls[$lang->lang] = '/' .$lang->lang. '/agents/' . $agent->id;
        }
        return $urls;
    }
}
