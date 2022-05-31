<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class TagsController extends Controller
{
    public function index()
    {
        $tags = Tag::orderBy('position', 'asc')->get();

        return view('admin.tags.index', compact('tags'));
    }

    public function create()
    {
        return view('admin.tags.create');
    }

    public function edit($id)
    {
        $tag = Tag::findOrFail($id);

        return view('admin.tags.edit', compact('tag'));
    }

    public function store(Request $request)
    {
        $toValidate = [];

        foreach ($this->langs as $lang) {
            $toValidate['name_' . $lang->lang] = 'required|max:255|unique:tags_translation,name';
        }

        $this->validate($request, $toValidate);

        $tag = new Tag();
        $tag->save();

        foreach ($this->langs as $lang):
            $tag->translations()->create([
                'lang_id' => $lang->id,
                'slug' => Str::slug(request('name_' . $lang->lang)),
                'name' => request('name_' . $lang->lang),
                'seo_title' => request('meta_title_' . $lang->lang),
                'seo_keywords' => request('meta_keywords_' . $lang->lang),
                'seo_description' => request('meta_description_' . $lang->lang),
                'seo_text' => request('seo_text_' . $lang->lang),
            ]);
        endforeach;

        return redirect('back/tags/' . $tag->id . '/edit');
    }

    public function update(Request $request, $id)
    {
        $tag = Tag::findOrFail($id);

        $toValidate = [];

        foreach ($this->langs as $lang) {
            $toValidate['name_' . $lang->lang] = 'required|max:255';
        }

        $this->validate($request, $toValidate);

        foreach ($this->langs as $lang):
            $tag->translations()->where('lang_id', $lang->id)->update([
                'name' => request('name_' . $lang->lang),
                'seo_title' => request('meta_title_' . $lang->lang),
                'seo_keywords' => request('meta_keywords_' . $lang->lang),
                'seo_description' => request('meta_description_' . $lang->lang),
                'seo_text' => request('seo_text_' . $lang->lang),
            ]);
        endforeach;

        session()->flash('message', 'Item has been updated!');

        return redirect()->back();
    }

    public function changePosition(Request $request)
    {
        $neworder = $request->get('neworder');
        $i = 1;
        $neworder = explode("&", $neworder);

        foreach ($neworder as $k => $v) {
            $id = str_replace("tablelistsorter[]=", "", $v);
            if (!empty($id)) {
                Tag::where('id', $id)->update(['position' => $i]);
                $i++;
            }
        }
    }

    public function destroy($id)
    {
        Tag::where('id', $id)->delete();
        return redirect()->back();
    }
}
