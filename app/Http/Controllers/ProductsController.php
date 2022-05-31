<?php

namespace App\Http\Controllers;

use App\Models\Parameter;
use Illuminate\Http\Request;
use App\Models\ProductCategory;
use App\Models\Product;
use App\Models\ParameterValueProduct;
use App\Models\ParameterValue;
use App\Models\ProductSimilar;
use App\Models\ProductPrice;


class ProductsController extends Controller
{
    private $sort = [];

    public function __construct()
    {
        parent::__construct();

        $this->sort = [
            'limit' => [
                0 => [20, trans('variables.perPage20')],
                1 => [30, trans('variables.perPage30')],
                2 => [40, trans('variables.perPage40')],
            ],
            'sort' => [
                0 => [0, trans('variables.populars'), 'position', 'asc'],
                1 => [1, trans('variables.priceAsc'), 'price', 'asc'],
                2 => [2, trans('variables.priceDesc'), 'price', 'desc']
            ],
        ];
    }

    public function renderCategory(Request $request, $slug)
    {
        $this->parseSorting($request->get('sort'), $request->get('limit'));

        $category = ProductCategory::with('translations')->where('active', 1)
            ->whereHas('translations', function ($query) use ($slug) {
                $query->where('slug', $slug);
            })->firstOrFail();

        $productsIds = $this->getProductsByParameters($request->get('parameters'), $category->id);

        $products = Product::where('category_id', $category->id)
            ->filterPrice($request->get('price'))
            ->filterSurface($request->get('surface'))
            ->where('active', 1)
            ->when($request->get('parameters'), function ($query) use ($productsIds) {
                return $query->whereIn('id', $productsIds);
            })
            ->orderBy($this->sort['sort'][0][2], $this->sort['sort'][0][3])
            ->paginate((int)$this->sort['limit'][0][1]);

        $seoData = $this->getSeo($category);
        $languagesUrls = $this->getCategoriesLanguageUrls($category);
        $parameters = $this->getParameters($category->id);
        $selectedParams = $this->getSelectedParameters($request->get('parameters'));

        $sorting = $this->sort;

        return view('front.catalog.category', compact('sorting', 'selectedParams', 'parameters', 'products', 'category', 'seoData', 'languagesUrls'));
    }

    public function renderProduct($categorySlug, $productSlug)
    {
        ProductCategory::select('id')->with('translations')->where('active', 1)
            ->whereHas('translations', function ($query) use ($categorySlug) {
                $query->where('slug', $categorySlug);
            })->firstOrFail();

        $product = Product::with('translations', 'category')->where('active', 1)
            ->whereHas('translations', function ($query) use ($productSlug) {
                $query->where('slug', $productSlug);
            })->firstOrFail();

        $similarProducts = Product::with('translations', 'category')
            ->where('id', '!=', $product->id)
            ->where('active', 1)
            ->where('category_id', $product->category_id)
            ->priceFilter($product->price)
            ->inRandomOrder()
            ->limit(9)
            ->get();

        $seoData = $this->getSeo($product);
        $languagesUrls = $this->getProductsLanguageUrls($product);
        $parameters = $this->getMainParameters($product->category_id);
        $agentEmail = $product->agent ? $product->agent->email : false;

        return view('front.catalog.product', compact('agentEmail', 'parameters', 'similarProducts', 'product', 'seoData', 'languagesUrls'));
    }

    public function search(Request $request)
    {
        $searchText = $request->get('search');

        $products = Product::with('translations', 'category')
            ->where('active', 1)
            ->where('code', 'LIKE', '%' . $searchText . '%')
            ->orWhereHas('translations', function ($query) use ($searchText) {
                $query->where('name', 'LIKE', '%' . $searchText . '%')
                    ->orWhere('subtitle', 'LIKE', '%' . $searchText . '%')
                    ->orWhere('description', 'LIKE', '%' . $searchText . '%')
                    ->orWhere('body', 'LIKE', '%' . $searchText . '%');
            })->paginate(20);

        foreach ($this->langs as $lang) {
            $languagesUrls[$lang->lang] = '/' . $lang->lang . '/search/?search=' . $searchText;
        }

        return view('front.catalog.search', compact('products', 'languagesUrls'));
    }

    public function parseSorting($sort, $limit)
    {
        if ($sort) {
            $findElementKey = array_search($sort, array_column($this->sort['sort'], 0));
            if ($findElementKey) {
                $extractElement = $this->sort['sort'][$findElementKey];
                unset($this->sort['sort'][$findElementKey]);
                array_unshift($this->sort['sort'], $extractElement);
            }
        }

        if ($limit) {
            $findElementKey = array_search($limit, array_column($this->sort['limit'], 0));
            if ($findElementKey) {
                $extractElement = $this->sort['limit'][$findElementKey];
                unset($this->sort['limit'][$findElementKey]);
                array_unshift($this->sort['limit'], $extractElement);
            }
        }
    }

    public function getSelectedParameters($parameters)
    {
        if (!$parameters) return [];

        $array = [];
        if (is_array($parameters)) {

            foreach ($parameters as $parameterId => $parameterOptions) {

                if (is_array($parameterOptions)) {
                    foreach ($parameterOptions as $parameterOption) {
                        $array[] = $parameterId . $parameterOption;
                    }
                }
            }
        }

        return $array;
    }

    public function getProductsByParameters($parameters, $categoryId)
    {
        $propsProducts = Product::select('id')
            ->where('active', 1)
            ->where('category_id', $categoryId)
            ->pluck('id')->toArray();

        if (is_array($parameters)) {
            foreach ($parameters as $param => $values) {
                $propIds = [];
                if (is_array($values)) {
                    foreach ($values as $value) {
                        $row = ParameterValueProduct::select('product_id')
                            ->where('parameter_value_id', $value)
                            ->where('parameter_id', $param)
                            ->whereIn('product_id', $propsProducts)
                            ->pluck('product_id')->toArray();
                        $propIds = array_merge($propIds, $row);
                    }
                    $propsProducts = $propIds;
                }
            }
        }

        return array_unique($propsProducts);
    }

    /**
     * Filter product list
     */
    public function filter(Request $request)
    {
        $sortDirection = 'desc';
        if ($request->get('sort') == 'priceAsc') {
            $sortDirection = 'asc';
        }

        $parameters = [];
        $propsProducts = [];
        $dependable = 0;
        $categoriesId = array_filter($request->get('categories'));
        $dependableCategory = ProductCategory::where('id', $request->get('category'))->first();

        $childCategories = ProductCategory::whereIn('parent_id', $categoriesId)->pluck('id')->toArray();
        $allCategoriesId = array_merge($categoriesId, $childCategories);

        if (!is_null($dependableCategory)) {
            if (!is_null($dependableCategory->subproductParameter)) {
                $dependable = $dependableCategory->subproductParameter->parameter_id;
            }
        }

        foreach ($request->get('properties') as $key => $param) {
            if ($param['name'] != $dependable) {
                $parameters[$param['name']][] = $param['value'];
            }
        }

        foreach ($parameters as $param => $values) {
            $propIds = [];
            foreach ($values as $key => $value) {
                $row = ParameterValueProduct::select('product_id')
                    ->where('parameter_value_id', $value)
                    ->where('parameter_id', $param)
                    ->when(count($propsProducts) > 0, function ($query) use ($propsProducts) {
                        return $query->whereIn('product_id', $propsProducts);
                    })
                    ->pluck('product_id')->toArray();

                $propIds = array_merge($propIds, $row);
            }
            $propsProducts = $propIds;
        }

        if ((count($request->get('properties')) > 0) && (count($propsProducts) == 0)) $propsProducts = [0];

        return Product::with($this->productRelationship)
            ->where($this->siteType, 1)
            ->where($this->warehouse, 1)
            ->where('active', 1)
            ->orderBy('position', 'asc')
            ->when(count($allCategoriesId) > 0, function ($query) use ($allCategoriesId) {
                return $query->whereIn('category_id', $allCategoriesId);
            })
            ->when(count($propsProducts) > 0, function ($query) use ($propsProducts) {
                return $query->whereIn('id', $propsProducts);
            })
            // ->with(['prices' => function ($query) use ($sortDirection) {
            //         $query->orderBy('price', $sortDirection);
            //     }])
            ->paginate(3);
    }

    public function setDefaultFilter(Request $request)
    {
        $categoryChilds = ProductCategory::where('parent_id', $request->get('category'))->pluck('id')->toArray();
        $categoryChilds = array_merge($categoryChilds, [$request->get('category')]);
        $allProducts = Product::whereIn('category_id', $categoryChilds)->get(); // without pagination

        $data['parameters'] = $this->_getParametersList($allProducts, $request->get('category'));

        $maxPrice = ProductPrice::where('currency_id', $this->currency->id)
            ->whereIn('product_id', $allProducts->pluck('id')->toArray())
            ->max('price');

        $data['prices']['min'] = 0;
        $data['prices']['max'] = $maxPrice;

        return $data;
    }


    /************************************** Helpers Methods ********************
     * Get parameters list
     */
    private function _getParametersList($allProducts, $categoryId)
    {
        $dependable = 0;
        $parametersId = ParameterValueProduct::whereIn('product_id', array_filter($allProducts->pluck('id')->toArray()))->pluck('parameter_value_id')->toArray();
        $dependableCategory = ProductCategory::where('id', $categoryId)->first();

        if (!is_null($dependableCategory)) {
            if (!is_null($dependableCategory->subproductParameter)) {
                $dependable = $dependableCategory->subproductParameter->parameter_id;
            }
        }

        $dependebleValues = ParameterValue::where('parameter_id', $dependable)->pluck('id')->toArray();

        $parametersId = array_merge($parametersId, $dependebleValues);
        return json_encode(array_filter($parametersId));
    }

    /**
     * Get items for sliders on product page
     */
    private function _getSlidersProducts($product)
    {
        $products = ['similars', 'someColors'];
        $someColorProdIds = [];
        $category = $product->category;

        $similarsArr = ProductSimilar::select('category_id')
            ->where('product_id', $product->id)
            ->pluck('category_id')->toArray();

        if (!count($similarsArr)) $similarsArr[] = $category->id;

        $colorId = ParameterValueProduct::select('parameter_value_id')
            ->where('product_id', $product->id)
            ->where('parameter_id', 2)
            ->first();

        if (!is_null($colorId)) {
            if ($colorId->parameter_value_id !== 0) {
                $someColorProdIds = ParameterValueProduct::select('product_id')
                    ->where('parameter_value_id', $colorId->parameter_value_id)
                    ->where('parameter_id', 2)
                    ->pluck('product_id')->toArray();
            }
        }
        $products['similars'] = Product::with($this->productRelationship)
            ->whereIn('category_id', $similarsArr)
            ->where('id', '!=', $product->id)
            ->where('active', 1)
            ->where($this->siteType, 1)
            ->where($this->warehouse, 1)
            ->get();

        $products['someColors'] = Product::with($this->productRelationship)
            ->whereIn('id', $someColorProdIds)
            ->where('id', '!=', $product->id)
            ->where('active', 1)
            ->where($this->siteType, 1)
            ->where($this->warehouse, 1)
            ->get();
        return $products;
    }

    private function getSeo($item): array
    {
        $seo['title'] = $item->translation->seo_title ?? $this->title . $item->translation->name .' '. $item->translation->subtitle ?? '' ;
        $seo['keywords'] = $item->translation->seo_keywords ?? $item->translation->name;
        $seo['description'] = $item->translation->seo_description ?? $item->translation->name;

        return $seo;
    }

    private function getCategoriesLanguageUrls($category): array
    {
        $urls = [];
        foreach ($category->translations as $translation) {
            $urls[$translation->lang->lang] = '/' . $translation->lang->lang . '/catalog/' . $translation->slug;
        }
        return $urls;
    }

    private function getProductsLanguageUrls($product): array
    {
        $urls = [];
        foreach ($product->translations as $translation) {
            $urls[$translation->lang->lang] = '/' . $translation->lang->lang . '/catalog/' . $product->category->translationByLanguage($translation->lang_id)->first()->slug . '/' . $translation->slug;
        }
        return $urls;
    }

    private function getParameters($category_id)
    {
        $category = ProductCategory::where('id', $category_id)->first();
        $properties = $category->params()->pluck('parameter_id')->toArray();

        return Parameter::whereIn('id', $properties)->where('in_filter', 1)->orderby('position', 'asc')->get();
    }

    private function getMainParameters($category_id)
    {
        $category = ProductCategory::where('id', $category_id)->first();
        $properties = $category->params()->pluck('parameter_id')->toArray();

        return Parameter::whereIn('id', $properties)->where('main', 1)->orderby('position', 'asc')->get();
    }
}
