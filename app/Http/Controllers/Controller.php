<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
use App\Models\Lang;
use App\Models\Country;
use App\Models\Currency;
use App\Base as Model;
use App\Setup;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $langs;
    protected $lang;
    protected $title = 'Blocks land | ';

    public function __construct()
    {
        $this->langs = Setup::$langs;
        $this->lang = Setup::$lang;
        $this->lang = Lang::where('default', 1)->first();
        $this->langs = Lang::get();
    }

    public function saveSettings(Request $request)
    {
        $url = str_replace(url('/'), '', url()->previous());
        $previousLang = $this->lang->lang;

        $lang = Lang::where('id', $request->get('langId'))->first();

        if (!is_null($lang)) {
            setcookie('lang_id', $lang->lang, time() + 10000000, '/');
            $url = str_replace('/' . $previousLang, '/' . $lang->lang, $url);
        }

        return url($url);
    }
}
