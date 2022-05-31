<?php

namespace App\Providers;

use App\Base as Model;
use App\Setup;
use Illuminate\Support\ServiceProvider;
use App\Models\FrontUserUnlogged;
use App\Models\Lang;
use App\Models\Module;
use App\Models\Cart;
use App\Models\Page;
use App\Models\WishList;
use App\Models\WishListSet;
use App\Models\ProductCategory;
use App\Models\Collection;
use App\Models\Country;
use App\Models\Currency;
use App\Models\Set;
use App\Models\Product;
use App\Models\Warehouse;
use App\Models\Entry;
use Illuminate\Http\Request;
use View;


class AppServiceProvider extends ServiceProvider
{
    public function boot(Request $request)
    {
        $setup = new Setup($request);
        $setup->init();
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register(){}

}
