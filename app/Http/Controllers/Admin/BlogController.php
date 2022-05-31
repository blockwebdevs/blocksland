<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;
use App\Models\BlogCategory;
use App\Models\Blog;
use App\Models\Gallery;
use Illuminate\Support\Str;

class BlogController extends Controller
{
    public function index()
    {
        $blogs = Blog::orderBy('position', 'asc')->get();

        return view('admin.blogs.index', compact('blogs'));
    }

    public function show($id)
    {
        return redirect()->route('blogs.index');
    }

    public function create()
    {
        return view('admin.blogs.create');
    }

    public function store(Request $request)
    {
        $toValidate = [];

        foreach ($this->langs as $lang) {
            $toValidate['title_' . $lang->lang] = 'required|max:255';
        }

        $this->validate($request, $toValidate);

        $request->active == 'on' ? $active = 1 : $active = 0;

        $blog = new Blog();
        $blog->alias = Str::slug(request('title_' . $this->lang->lang));
        $blog->active = $active;
        $blog->position = 1;
        $blog->date_time = request('date');

        if ($request->image) {
            $image = uniqid() . '-' . $request->image->getClientOriginalName();
            $request->image->move('images/blogs', $image);
            $blog->image = $image;
        }

        $blog->save();

        foreach ($this->langs as $lang):
            $blog->translation()->create([
                'lang_id' => $lang->id,
                'name' => request('title_' . $lang->lang),
                'slug' => Str::slug(request('title_' . $lang->lang)),
                'description' => request('description_' . $lang->lang),
                'body' => request('body_' . $lang->lang),
                'seo_text' => request('seo_text_' . $lang->lang),
                'seo_title' => request('seo_title_' . $lang->lang),
                'seo_description' => request('seo_descr_' . $lang->lang),
                'seo_keywords' => request('seo_keywords_' . $lang->lang)
            ]);
        endforeach;

        Session::flash('message', 'New item has been created!');

        return redirect('back/blogs/' . $blog->id . '/edit');
    }

    public function edit($id)
    {
        $blog = Blog::with('translations')->findOrFail($id);

        return view('admin.blogs.edit', compact('blog'));
    }

    public function update(Request $request, $id)
    {
        $blog = Blog::findOrFail($id);

        $toValidate = [];

        foreach ($this->langs as $lang) {
            $toValidate['title_' . $lang->lang] = 'required|max:255';
        }

        $this->validate($request, $toValidate);

        $request->active == 'on' ? $active = 1 : $active = 0;

        if ($request->image) {
            $image = uniqid() . '-' . $request->image->getClientOriginalName();
            $request->image->move('images/blogs', $image);
            $blog->image = $image;
        }

        $blog->active = $active;
        $blog->date_time = request('date');
        $blog->save();

        foreach ($this->langs as $lang):
            $blog->translations()->where('lang_id', $lang->id)->update([
                'name' => request('title_' . $lang->lang),
                'description' => request('description_' . $lang->lang),
                'body' => request('body_' . $lang->lang),
                'seo_text' => request('seo_text_' . $lang->lang),
                'seo_title' => request('seo_title_' . $lang->lang),
                'seo_description' => request('seo_descr_' . $lang->lang),
                'seo_keywords' => request('seo_keywords_' . $lang->lang)
            ]);
        endforeach;

        return redirect()->back();
    }

    public function changePosition()
    {
        $neworder = Input::get('neworder');
        $i = 1;
        $neworder = explode("&", $neworder);

        foreach ($neworder as $k => $v) {
            $id = str_replace("tablelistsorter[]=", "", $v);
            if (!empty($id)) {
                Blog::where('id', $id)->update(['position' => $i]);
                $i++;
            }
        }
    }

    public function status($id)
    {
        $blog = Blog::findOrFail($id);

        if ($blog->active == 1) $blog->active = 0;
        else $blog->active = 1;

        $blog->save();

        return redirect()->route('blogs.index');
    }


    public function destroy($id)
    {
        $blog = Blog::findOrFail($id);
        $blog->delete();

        session()->flash('message', 'Item has been deleted!');
        return redirect()->route('blogs.index');
    }

}
