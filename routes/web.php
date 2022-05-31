<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\TagsController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\AgentsController;
use App\Http\Controllers\FeedBackController;

//\URL::forceScheme('http');
$prefix = session('applocale');

Route::get('/', [PagesController::class, 'index'])->name('index');

Route::group(['prefix' => $prefix], function () {
    Route::get('/', [PagesController::class, 'index']);

    Route::get('/search', [ProductsController::class, 'search']);

    Route::get('/blog', [PagesController::class, 'renderBlog']);
    Route::get('/blog/{post}', [BlogController::class, 'renderPost']);

    Route::get('/agents/{id}', [AgentsController::class, 'index']);

    Route::get('/tag/{tag}', [TagsController::class, 'index']);

    Route::get('/catalog/{slug}', [ProductsController::class, 'renderCategory']);
    Route::get('/catalog/{categorySlug}/{productSlug}', [ProductsController::class, 'renderProduct']);

    Route::post('/feed-back', [FeedBackController::class, 'sendFeedBack']);
    Route::post('/order-call', [FeedBackController::class, 'orderCall']);

    Route::get('/{page}', [PagesController::class, 'renderPage']);

    // Localization
    Cache::forget('lang.js');
    Route::get('/js/lang.js', 'LanguagesController@changeLangScript')->name('assets.lang');
});

Route::get('/auth/login', 'AdminAuth\CustomAuthController@login')->name('login');
Route::post('/auth/login', 'AdminAuth\CustomAuthController@checkLogin');

Route::get('/auth/register', 'AdminAuth\CustomAuthController@register');
Route::post('/auth/register', 'AdminAuth\CustomAuthController@checkRegister');
Route::get('/auth/logout', 'AdminAuth\CustomAuthController@logout');
Route::get('/sitemap.xml', 'SitemapController@index');

Route::group(['middleware' => ['web']], function () {
    $namespace = 'Admin';

    Route::group(['namespace' => $namespace, 'prefix' => 'back', 'middleware' => 'auth'], function () {
        Route::get('/', [\App\Http\Controllers\Admin\AdminController::class, 'index'])->name('back');
        Route::resource('/banners', 'BannersController');

        // Translations
        Route::get('/translations', 'TranslationsController@index');
        Route::get('/translations/generate', 'TranslationsController@createTraslation');
        Route::post('/translations-get-groups', 'TranslationsController@getGroups');
        Route::post('/translations-create-group', 'TranslationsController@createGroup');
        Route::post('/translations-save-new-line', 'TranslationsController@saveNewLine');
        Route::post('/translations-update', 'TranslationsController@updateTranslations');
        Route::post('/translations-remove', 'TranslationsController@removeTranslations');
        Route::post('/translations-search', 'TranslationsController@searchTranslations');
        Route::post('/translations-cancel-search', 'TranslationsController@cancelSearchTranslations');
        Route::post('/translations-set-active', 'TranslationsController@setActive');

        // Admin Users
        Route::resource('/users', 'AdminUserController');

        Route::resource('/tags', 'TagsController');
        Route::post('/tags/changePosition', 'TagsController@changePosition');

        Route::resource('/agents', 'AgentsController');
        Route::post('/agents/changePosition', 'AgentsController@changePosition');

        Route::resource('/testimonials', 'TestimonialsController');
        Route::post('/testimonials/changePosition', 'TestimonialsController@changePosition');

        // Lead Mangment
        Route::resource('/feedback', 'FeedBackController');
        Route::get('/feedback/clooseStatus/{id}/{status}', 'FeedBackController@changeStatus');

        // Pages
        Route::resource('/static-pages', 'StaticPagesController');
        Route::get('/static-pages/google-api/synchronize', 'StaticPagesController@googleApisynchronize');

        Route::resource('/pages', 'PagesController');
        Route::post('/pages/changePosition', 'PagesController@changePosition');
        Route::patch('/pages/{id}/change-status', 'PagesController@status')->name('pages.change.status');

        // Modules
        Route::resource('/modules', 'ModulesController');
        Route::post('/modules/changePosition', 'ModulesController@changePosition');

        // Product Categories
        Route::resource('/product-categories', 'ProductCategoryController');
        Route::post('/product-categories/get-categories', 'ProductCategoryController@getCategories');
        Route::post('/product-categories/change-position', 'ProductCategoryController@changePosition');
        Route::post('/product-categories/add-new', 'ProductCategoryController@store');
        Route::post('/product-categories/remove', 'ProductCategoryController@remove');
        Route::post('/product-categories/get-all-categories', 'ProductCategoryController@getAllCategories');
        Route::post('/product-categories/remove-moving-category', 'ProductCategoryController@removeWithMovingCategory');
        Route::post('/product-categories/move-products', 'ProductCategoryController@moveProducts');
        Route::get('/product-categories/remove-dependable-parameter/{id}', 'ProductCategoryController@removeDepedableParameter');
        Route::get('/product-categories/delete-banner/{device}/{id}', 'ProductCategoryController@deleteBanner');
        
        // Blogs
        Route::resource('/blogs', 'BlogController');
        Route::patch('/blogs/{id}/change-status', 'BlogController@status')->name('blogs.change.status');
        Route::get('/blogs/category/{id}', 'BlogController@getByCategory');

        // Parameters
        Route::resource('/parameter-groups', 'ParameterGroupsController');
        Route::resource('/parameters', 'ParametersController');
        Route::post('/parameter-store', 'ParametersController@store');
        Route::post('/parameter-update/{id}', 'ParametersController@update');
        Route::post('/remove-old-value', 'ParametersController@removeOldValue');
        Route::post('/parameter-check-dependable', 'ParametersController@checkParameterDependable');
        Route::post('/parameters/addImages', 'ParametersController@addImages');
        Route::post('/parameters/changePosition', 'ParametersController@changePosition');

        // Products
        Route::resource('/products', 'ProductsController');
        Route::get('/products/category/{category}', 'ProductsController@getProductsByCategory')->name('products.category');
        Route::get('/products/sets/{set}', 'ProductsController@getProductsBySet')->name('products.set');
        Route::post('/products/category/{category}/changePosition', 'ProductsController@changePosition')->name('products.changePosition');
        Route::post('/products/gallery/add/{product}', 'ProductsController@addProductImages')->name('products.images.add');
        Route::post('/products/gallery/edit/{product}', 'ProductsController@editProductImages')->name('products.images.edit');
        Route::get('/products/gallery/first/{id}', 'ProductsController@addFirstProductImages')->name('products.images.add.first');
        Route::post('/products/gallery/main', 'ProductsController@addMainProductImages')->name('products.images.add.main');
        Route::post('/products/gallery/delete', 'ProductsController@deleteProductImages')->name('products.images.add.delete');

        // optimize images
        Route::get('/optimize/all-images', 'AdminController@optimizeAllImages');
        Route::post('ckeditor/upload', 'AdminController@upload')->name('ckeditor.upload');

        // Settings
        Route::group(['prefix' => 'settings'], function () {
            Route::resource('/languages', 'LanguagesController');
            Route::patch('/languages/set-default/{id}', 'LanguagesController@setDefault')->name('languages.default');
            Route::patch('/languages/set-active/{id}', 'LanguagesController@setActive')->name('languages.active');
        });
    });
});
