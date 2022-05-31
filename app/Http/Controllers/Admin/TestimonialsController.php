<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Testimonial;
use Illuminate\Http\Request;


class TestimonialsController extends Controller
{
    public function index()
    {
        $testimonials = Testimonial::orderBy('position', 'asc')->get();

        return view('admin.testimonials.index', compact('testimonials'));
    }

    public function create()
    {
        return view('admin.testimonials.create');
    }

    public function edit($id)
    {
        $testimonial = Testimonial::findOrFail($id);

        return view('admin.testimonials.edit', compact('testimonial'));
    }

    public function store(Request $request)
    {
        $testimonial = new Testimonial();
        $testimonial->title = $request->get('title');
        $testimonial->body = $request->get('body');
        $testimonial->author = $request->get('author');

        $testimonial->save();

        return redirect('back/testimonials/' . $testimonial->id . '/edit');
    }

    public function update(Request $request, $id)
    {
        $testimonial = Testimonial::findOrFail($id);

        $testimonial->title = $request->get('title');
        $testimonial->body = $request->get('body');
        $testimonial->author = $request->get('author');

        $testimonial->save();

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
                Testimonial::where('id', $id)->update(['position' => $i]);
                $i++;
            }
        }
    }

    public function destroy($id)
    {
        Testimonial::where('id', $id)->delete();
        return redirect()->back();
    }
}
