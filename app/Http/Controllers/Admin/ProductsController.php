<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Agent;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Intervention\Image\ImageManagerStatic as Image;
use App\Models\Product;
use App\Models\ProductTranslation;
use App\Models\ProductCategory;
use App\Models\Parameter;
use App\Models\ProductImage;
use App\Models\ProductImageTranslation;
use App\Models\ProductSimilar;
use App\Models\ParameterValueProduct;


class ProductsController extends Controller
{
    public function index()
    {
        $products = Product::orderBy('position', 'asc')->get();
        $category = null;

        return view('admin.products.index', compact('products', 'category'));
    }

    public function create(Request $request)
    {
        $productCategory = $request->get('category');
        $category = ProductCategory::find($request->get('category'));
        $parameters = $this->getProperties($productCategory);
        $agents = Agent::orderBy('job', 'asc')->get();
        $tags = Tag::orderBy('position', 'desc')->get();

        return view(' admin.products.create', compact('category', 'parameters', 'agents', 'tags'));
    }

    public function edit(Request $request, $id)
    {
        $product = Product::with(['translations'])->findOrFail($id);
        $parameters = $this->getProperties($product->category_id);
        $images = ProductImage::where('product_id', $id)->orderBy('main', 'desc')->get();
        $existentParameters = ParameterValueProduct::where('product_id', $product->id)
            ->pluck('parameter_value_id', 'parameter_id')
            ->toArray();
        $agents = Agent::orderBy('job', 'asc')->get();
        $tags = Tag::orderBy('position', 'desc')->get();

        return view(' admin.products.edit', compact('product', 'parameters', 'images', 'existentParameters', 'agents', 'tags'));
    }

    public function store(Request $request)
    {
        $active = 0;
        $recommended = 0;
        $toValidate['category_id'] = 'required';
        $toValidate['code'] = 'required|max:255|unique:products,code';

        foreach ($this->langs as $lang) {
            $toValidate['name_' . $lang->lang] = 'required|max:255';
        }

        $this->validate($request, $toValidate);

        if ($request->active == 'on') {
            $active = 1;
        }

        if ($request->recommended == 'on') {
            $recommended = 1;
        }

        $product = new Product();
        $product->category_id = $request->category_id;
        $product->tag_id = $request->tag_id;
        $product->agent_id = $request->agent_id;
        $product->alias = Str::slug($request->get('name_' . $lang->lang));
        $product->code = $request->code;
        $product->price = $request->price;
        $product->surface = $request->surface;
        $product->active = $active;
        $product->recommended = $recommended;
        $product->position = 1;
        $product->iframe = $request->iframe;
        $product->save();

        foreach ($this->langs as $lang):
            $product->translations()->create([
                'lang_id' => $lang->id,
                'name' => request('name_' . $lang->lang),
                'slug' => Str::slug(request('name_' . $lang->lang) . '-' . request('code')),
                'subtitle' => request('subtitle_' . $lang->lang),
                'body' => request('body_' . $lang->lang),
                'description' => request('description_' . $lang->lang),
                'seo_title' => request('meta_title_' . $lang->lang),
                'seo_keywords' => request('meta_keywords_' . $lang->lang),
                'seo_description' => request('meta_description_' . $lang->lang),
            ]);
        endforeach;


        if ($request->get('params')) {
            $this->saveProperties($request->get('params'), $product->id);
        }

        if ($request->file('images')) {
            $this->addProductImages($request->file('images'), $product->id);
        }

        return redirect('back/products/' . $product->id . '/edit?category=' . $product->category_id);
    }


    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);
        $active = 0;
        $recommended = 0;
        $toValidate['category_id'] = 'required';
        $toValidate['code'] = 'required|max:255';

        foreach ($this->langs as $lang) {
            $toValidate['name_' . $lang->lang] = 'required|max:255';
        }

        $this->validate($request, $toValidate);

        if ($request->active == 'on') {
            $active = 1;
        }

        if ($request->recommended == 'on') {
            $recommended = 1;
        }

        $product->category_id = $request->category_id;
        $product->tag_id = $request->tag_id;
        $product->agent_id = $request->agent_id;
        $product->code = $request->code;
        $product->price = $request->price;
        $product->surface = $request->surface;
        $product->active = $active;
        $product->recommended = $recommended;
        $product->iframe = $request->iframe;
        $product->save();

        foreach ($this->langs as $lang):
            $product->translations()->where('lang_id', $lang->id)->update([
                'name' => request('name_' . $lang->lang),
                'subtitle' => request('subtitle_' . $lang->lang),
                'body' => request('body_' . $lang->lang),
                'description' => request('description_' . $lang->lang),
                'seo_title' => request('meta_title_' . $lang->lang),
                'seo_keywords' => request('meta_keywords_' . $lang->lang),
                'seo_description' => request('meta_description_' . $lang->lang),
            ]);
        endforeach;

        if ($request->get('params')) {
            $this->saveProperties($request->get('params'), $product->id);
        }

        if ($request->file('images')) {
            $this->addProductImages($request->file('images'), $product->id);
        }

        session()->flash('message', 'Item has been updated!');

        return redirect()->back();
    }


    public function addProductImages($files, $productId)
    {
        foreach ($files as $key => $file) {
            $imageName = uniqid() . $file->getClientOriginalName();

            $imageResize = Image::make($file->getRealPath());

            $imageResize->save(public_path('images/products/og/' . $imageName), 75);

            $imageResizeSM = Image::make($file->getRealPath());

            $imageResizeSM->resize(null, 280, function ($constraint) {
                    $constraint->aspectRatio();
                })->save('images/products/sm/' . $imageName, 85);

            ProductImage::create([
                'product_id' => $productId,
                'src' => $imageName,
                'main' => 0,
                'first' => 0
            ]);
        }

        $findMain = ProductImage::select('id')->where('main', 1)->where('product_id', $productId)->first();
        if (is_null($findMain)) {
            $image = ProductImage::select('id')->where('product_id', $productId)->first();
            $image->update(['main' => 1]);
        }
    }


    public function getProperties($category_id)
    {
        $category = ProductCategory::where('id', $category_id)->first();
        $properties = $category->params()->pluck('parameter_id')->toArray();

        return Parameter::whereIn('id', $properties)->orderby('type', 'desc')->get();
    }


    public function saveProperties($parameters, $productId)
    {
        foreach ($parameters as $key => $value) {
            ParameterValueProduct::where('product_id', $productId)
                ->where('parameter_id', $key)
                ->delete();

            ParameterValueProduct::create([
                'product_id' => $productId,
                'parameter_id' => $key,
                'parameter_value_id' => $value
            ]);
        }
    }


    public function getProductsByCategory(Request $request, $categoryId)
    {
        $searchText = $request->get('search');

        if (!$searchText) {
            $products = Product::where('category_id', $categoryId)->with('translation')->orderBy('position', 'asc')->paginate(100);
            $category = ProductCategory::with('translation')->find($categoryId);

            return view(' admin.products.index', compact('products', 'category'));
        }

        $products = Product::with('translations', 'category')
            ->orderBy('position', 'asc')
            ->where('code', 'LIKE', '%' . $searchText . '%')
            ->orWhereHas('translations', function ($query) use ($searchText) {
                $query->where('name', 'LIKE', '%' . $searchText . '%')
                    ->orWhere('subtitle', 'LIKE', '%' . $searchText . '%')
                    ->orWhere('description', 'LIKE', '%' . $searchText . '%')
                    ->orWhere('body', 'LIKE', '%' . $searchText . '%');
            })
            ->where('category_id', $categoryId)
            ->paginate(100);

        $category = ProductCategory::with('translation')->find($categoryId);

        return view(' admin.products.index', compact('products', 'category'));
    }


    public function changePosition(Request $request)
    {
        $neworder = $request->get('neworder');
        $i = 1;
        $neworder = explode("&", $neworder);

        foreach ($neworder as $k => $v) {
            $id = str_replace("tablelistsorter[]=", "", $v);
            if (!empty($id)) {
                Product::where('id', $id)->update(['position' => $i]);
                $i++;
            }
        }
    }

    public function addMainProductImages(Request $request)
    {
        $image = ProductImage::findOrFail($request->get('id'));

        if (!is_null($image)) {
            ProductImage::where('product_id', $image->product_id)->update([
                'main' => 0,
            ]);

            $image->update(['main' => 1]);
        }

        return "true";
    }


    public function deleteProductImages(Request $request)
    {
        $image = ProductImage::where('product_id', $request->get('productId'))->where('id', $request->get('id'))->first();
        if (!is_null($image)) {
            $product = Product::find($image->product_id);

            ProductImage::where('product_id', $request->get('productId'))->where('id', $request->get('id'))->delete();
            $images = ProductImageTranslation::where('product_image_id', $request->get('id'))->get();

            $file = file_exists(public_path('images/products/og/' . $image->src));
            if ($file) {
                unlink(public_path('images/products/og/' . $image->src));
            }

            $file = file_exists(public_path('images/products/md/' . $image->src));
            if ($file) {
                unlink(public_path('images/products/md/' . $image->src));
            }

            $file = file_exists(public_path('images/products/sm/' . $image->src));
            if ($file) {
                unlink(public_path('images/products/sm/' . $image->src));
            }

            if (!empty($images)) {
                foreach ($images as $key => $oneImage) {
                    ProductImageTranslation::where('id', $oneImage->id)->delete();
                }
            }
        }

        return "true";
    }

    public function destroy($id)
    {
        $images = ProductImage::where('product_id', $id)->get();
        foreach ($images as $key => $image) {
            ProductImage::where('id', $image->id)->delete();

            if (file_exists(public_path('images/products/og/' . $image->src))) {
                unlink(public_path('images/products/og/' . $image->src));
            }
            if (file_exists(public_path('images/products/sm/' . $image->src))) {
                unlink(public_path('images/products/sm/' . $image->src));
            }
        }

        Product::where('id', $id)->delete();
        ProductTranslation::where('product_id', $id)->delete();

        return redirect()->back();
    }
}
