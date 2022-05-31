<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\ImageManagerStatic as Image;
use App\Models\ProductCategory;
use App\Models\Product;
use App\Models\Parameter;
use App\Models\ParameterCategory;
use App\Models\SubProductParameter;
use App\Models\SubProduct;
use App\Models\ParameterGroup;
use App\Models\ParameterGroupCategory;
use App\Models\Lang;
use Illuminate\Support\Str;


class ProductCategoryController extends Controller
{
    public $lang;
    public $langs = [];

    public function __construct()
    {
        $this->lang = Lang::where('default', 1)->first();
        $this->langs = Lang::get();
    }

    public function index()
    {
        $categories = ProductCategory::where('parent_id', 0)->get();

        return view('admin.productCategories.index', compact('categories'));
    }

    public function show()
    {
        return redirect()->route('product-categories.index');
    }

    public function create()
    {
        return redirect()->route('product-categories.index');
    }

    public function getCategories()
    {
        $categories = ProductCategory::with([
            'translation',
            'products',
            'children.translation',
            'children.products',
            'children.children.translation',
            'children.children.products',
            'children.children.children.translation',
            'children.children.children.products',
            'children.children.children.children.translation',
            'children.children.children.children.products',
        ])
            ->orderBy('position', 'asc')
            ->orderBy('created_at', 'desc')
            ->where('parent_id', 0)->get();

        return $categories;
    }

    public function changePosition(Request $request)
    {
        $categories = $request->get('categories');
        $positon = 1;

        if (count($categories) > 0) {
            foreach ($categories as $category) {
                $positon++;
                ProductCategory::where('id', $category['id'])->update(['parent_id' => 0, 'position' => $positon, 'level' => 1]);
                if (array_key_exists('children', $category)) {
                    foreach ($category['children'] as $children) {
                        $positon++;
                        ProductCategory::where('id', $children['id'])->update(['parent_id' => $category['id'], 'position' => $positon, 'level' => 2]);
                        if (array_key_exists('children', $children)) {
                            foreach ($children['children'] as $children2) {
                                $positon++;
                                ProductCategory::where('id', $children2['id'])->update(['parent_id' => $children['id'], 'position' => $positon, 'level' => 3]);
                                if (array_key_exists('children', $children2)) {
                                    foreach ($children2['children'] as $children3) {
                                        $positon++;
                                        ProductCategory::where('id', $children3['id'])->update(['parent_id' => $children2['id'], 'position' => $positon, 'level' => 4]);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        $data['stauts'] = 'true';
        $data['message'] = 'succes loading';
        $data['categories'] = $this->getCategories();
        return $data;
    }

    public function checkProducts($categoryId)
    {
        $category = ProductCategory::find($categoryId);

        if (count($category->products) > 0) {
            return false;
        }
        return true;
    }

    public function store(Request $request)
    {
        $parentId = 0;
        $level = 1;
        $titles = array_filter($request->get('titles'), function ($var) {
            return !is_null($var);
        });

        if ($request->get('categoryId')) {
            $parentId = $request->get('categoryId');
            $level = $request->get('level') + 1;
        }

        $alias = Str::slug($titles[$this->lang->id]);

        $findSlug = ProductCategory::where('alias', $alias)->first();

        if (!is_null($findSlug)) $alias = $alias . rand(0, 100);

        $category = ProductCategory::create([
            'parent_id' => $parentId,
            'alias' => $alias,
            'level' => $level,
            'position' => 1,
            'succesion' => 1,
        ]);

        foreach ($titles as $key => $title) {
            $category->translations()->create([
                'lang_id' => $key,
                'name' => $title,
                'slug' => Str::slug($title)
            ]);
        }

        $data['category'] = $category;
        $data['categories'] = $this->getCategories();

        return $data;
    }

    public function getAllCategories(Request $request)
    {
        $categories = ProductCategory::with([
            'translation',
            'products',
            'children',
        ])
            ->orderBy('position', 'asc')
            ->orderBy('created_at', 'desc')
            ->get();

        return $categories;
    }

    public function removeWithMovingCategory(Request $request)
    {
        $categoryToMoveId = $request->get('category_to_move');
        $categoryId = $request->get('category_id');
        $parent = ProductCategory::where('id', $categoryToMoveId)->first();

        $children = ProductCategory::where('parent_id', $categoryId)->get();

        if (!is_null($parent)) {
            foreach ($children as $key => $child) {
                ProductCategory::where('id', $child->id)
                    ->update([
                        'parent_id' => $categoryToMoveId,
                        'level' => $parent->level + 1
                    ]);
            }

            $products = Product::where('category_id', $categoryId)->pluck('id')->toArray();
            Product::whereIn('id', $products)->update(['category_id' => $categoryToMoveId]);
        }

        ProductCategory::where('id', $categoryId)->delete();

        return $this->getCategories();
    }


    public function moveProducts(Request $request)
    {
        $parent = $request->get('parent_category');
        $child = $request->get('child_category');

        $parentCategory = ProductCategory::find($parent);
        $childCategory = ProductCategory::find($child);

        if (!is_null($parentCategory) && !is_null($childCategory)) {
            $parentProducts = Product::where('category_id', $parentCategory->id)->update([
                'category_id' => $childCategory->id
            ]);

            ProductCategory::where('id', $child)->update([
                'parent_id' => $parent,
                'level' => $parentCategory->level + 1,
            ]);
        }

        return $this->getCategories();
    }

    public function edit($id)
    {
        $category = ProductCategory::with('translations')->findOrFail($id);
        $parameters = Parameter::get();

        return view(' admin.productCategories.edit', compact('category', 'parameters'));
    }

    public function update(Request $request, $id)
    {
        ini_set('memory_limit', '-1');
        ini_set('max_execution_time', 900);

        $productCategory = ProductCategory::findOrFail($id);
        $active = 0;

        if ($request->get('active') == 'on') $active = 1;

        if ($request->file('icon')) {
            $file = $request->file('icon');
            $icon = uniqid() . '-' . $file->getClientOriginalName();
            $imageResize = Image::make($file->getRealPath());

            $imageResize->save(public_path('images/categories/og/' . $icon), 75);
            $imageResize->resize(480, null, function ($constraint) {
                $constraint->aspectRatio();
            })->save('images/categories/sm/' . $icon);

            $productCategory->icon = $icon;
        }

        $productCategory->active = $active;
        $productCategory->alias = request('alias');
        $productCategory->unit = request('unit');
        $productCategory->link_sale = request('link_sale');
        $productCategory->link_rent = request('link_rent');
        $productCategory->save();

        foreach ($this->langs as $lang):
            $productCategory->translations()->where('product_category_id', $id)->where('lang_id', $lang->id)->update([
                'name' => request('name_' . $lang->lang),
                'description' => request('description_' . $lang->lang),
                'seo_text' => request('seo_text_' . $lang->lang),
                'seo_title' => request('seo_title_' . $lang->lang),
                'seo_description' => request('seo_description_' . $lang->lang),
                'seo_keywords' => request('seo_keywords_' . $lang->lang),
            ]);
        endforeach;

        $properties = request('properties');
        $allItems = [];

//        if ($request->get('parameter_groups')) {
//            ParameterGroupCategory::where('category_id', $productCategory->id)->delete();
//
//            foreach ($request->get('parameter_groups') as $key => $value) {
//                $productCategory->parametersGroups()->create([
//                    'group_id' => $value,
//                ]);
//            }
//        }

//        if (!empty($properties)) {
//            foreach ($properties as $key => $property) {
//                $allItems[] = $property;
//                $productProperty = ParameterCategory::where('parameter_id', $property)->where('category_id', $id)->first();
//
//                if (!is_null($productProperty)) {
//                    ParameterCategory::where('id', $productProperty->id)->update([
//                        'parameter_id' => $property,
//                        'category_id' => $id
//                    ]);
//                } else {
//                    ParameterCategory::create([
//                        'parameter_id' => $property,
//                        'category_id' => $id
//                    ]);
//                }
//            }
//        }
//
//        ParameterCategory::where('category_id', $id)->whereNotIn('parameter_id', $allItems)->delete();
//
//        if ($request->get('dependable-status') == 'true') {
//            $childCategories = $this->getCategoriesChilds($productCategory->id);
//            $parameterId = $request->get('dependable');
//
//            if (count($childCategories) > 0) {
//                foreach ($childCategories as $key => $category) {
//                    $parameterSubproduct = SubProductParameter::where('category_id', $category)->first();
//
//                    if (is_null($parameterSubproduct)) {
//                        SubProductParameter::create([
//                            'category_id' => $category,
//                            'parameter_id' => $parameterId,
//                        ]);
//                    } else {
//                        SubProductParameter::where('id', $parameterSubproduct->id)->update([
//                            'parameter_id' => $parameterId,
//                        ]);
//                    }
//                }
//            }
//
//            $parameter = Parameter::find($parameterId);
//            $products = Product::whereIn('category_id', $childCategories)->get();
//            $x = 'A';
//
//            if (!is_null($parameter)) {
//                if (count($parameter->parameterValues()->get())) {
//                    foreach ($products as $key => $product) {
//                        // $x = 'A';
//                        foreach ($parameter->parameterValues()->get() as $key => $value) {
//                            $subproduct = SubProduct::where('product_id', $product->id)->where('parameter_id', $parameter->id)->where('value_id', $value->id)->first();
//                            $combinationJSON = [$parameter->id => $value->id];
//                            $x = $value->suffix;
//                            if (is_null($subproduct)) {
//                                SubProduct::create([
//                                    'product_id' => $product->id,
//                                    'parameter_id' => $parameter->id,
//                                    'value_id' => $value->id,
//                                    'code' => $product->code . '-' . $x,
//                                    'combination' => json_encode($combinationJSON),
//                                    'price' => $product->price,
//                                    'actual_price' => $product->actual_price,
//                                    'discount' => $product->discount,
//                                    'stoc' => $product->stock,
//                                    'active' => 1,
//                                ]);
//                            } else {
//                                SubProduct::where('id', $subproduct->id)->update([
//                                    'product_id' => $product->id,
//                                    'parameter_id' => $parameter->id,
//                                    'value_id' => $value->id,
//                                    'code' => $product->code . '-' . $x,
//                                    'combination' => json_encode($combinationJSON),
//                                ]);
//                            }
//                            $x++;
//                        }
//                    }
//                }
//            }
//
//            $parameterValuesId = $parameter->parameterValues()->get()->pluck('id')->toArray();
//            SubProduct::whereIn('product_id', $products->pluck('id')->toArray())->whereNotIn('value_id', $parameterValuesId)->delete();
//            SubProduct::whereIn('product_id', $products->pluck('id')->toArray())->where('parameter_id', '!=', $parameterId)->delete();
//
//        }

        session()->flash('message', 'New item has been created!');

        return redirect()->back();
    }

    public function getCategoriesChilds($categoryId)
    {
        $categoriesId = [];
        $category1 = ProductCategory::find($categoryId);

        $categoriesId = array_merge($categoriesId, [$categoryId]);

        if (!is_null($category1)) {
            $categories2 = ProductCategory::where('parent_id', $category1->id)->pluck('id')->toArray();
            if (count($categories2) > 0) {
                $categoriesId = array_merge($categoriesId, $categories2);
                $categories3 = ProductCategory::whereIn('parent_id', $categories2)->pluck('id')->toArray();
                if (count($categories3) > 0) {
                    $categoriesId = array_merge($categoriesId, $categories3);
                }
            }
        }

        return $categoriesId;
    }

    public function removeDepedableParameter($id)
    {
        $childCategories = ProductCategory::where('parent_id', $id)->pluck('id')->toArray();
        $lastChildCategories = ProductCategory::whereIn('parent_id', $childCategories)->pluck('id')->toArray();

        $categoriesIds = array_merge([$id], array_merge($childCategories, $lastChildCategories));

        $products = Product::whereIn('category_id', $categoriesIds)->get();

        foreach ($products as $key => $product) {
            if ($product->subproducts()->count() > 0) {
                foreach ($product->subproducts as $key => $subproduct) {
                    SubProduct::where('id', $subproduct->id)->delete();
                }
            }
        }

        SubProductParameter::where('category_id', $id)->delete();

        return redirect()->back();
    }

    public function remove(Request $request)
    {
        $category = ProductCategory::findOrFail($request->get('category_id'));

        @unlink(public_path('/images/categories/og/' . $category->icon));

        foreach ($this->langs as $lang):
            @unlink(public_path('/images/categories/og/' . $category->translationByLang($lang->id)->first()->banner_desktop));
            @unlink(public_path('/images/categories/og/' . $category->translationByLang($lang->id)->first()->banner_mobile));
        endforeach;

        $category->delete();

        return $this->getCategories();
    }

    public function deleteBanner($device, $id)
    {
        $collection = ProductCategory::findOrFail($id);

        if ($device == 'mobile') {
            $collection->update([
                'banner_mobile' => null,
            ]);
            @unlink(public_path('/images/categories/og/' . $collection->banner_mobile));
            @unlink(public_path('/images/categories/sm/' . $collection->banner_mobile));
        } else {
            $collection->update([
                'banner_desktop' => null,
            ]);
            @unlink(public_path('/images/categories/og/' . $collection->banner_desktop));
            @unlink(public_path('/images/categories/sm/' . $collection->banner_desktop));
        }

        return redirect()->back();
    }

}
