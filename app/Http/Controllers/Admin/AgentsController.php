<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Agent;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class AgentsController extends Controller
{
    public function index()
    {
        $agents = Agent::orderBy('position', 'asc')->get();

        return view('admin.agents.index', compact('agents'));
    }

    public function create()
    {
        return view('admin.agents.create');
    }

    public function edit($id)
    {
        $agent = Agent::findOrFail($id);

        return view('admin.agents.edit', compact('agent'));
    }

    public function store(Request $request)
    {
        $toValidate['name'] = 'required|max:255';

        $this->validate($request, $toValidate);

        $agent = new Agent();
        $agent->name = $request->get('name');
        $agent->email = $request->get('email');
        $agent->phone = $request->get('phone');
        $agent->telegram = $request->get('telegram');
        $agent->job = $request->get('job');

        if ($request->image) {
            $image = uniqid() . '-' . $request->image->getClientOriginalName();
            $request->image->move('images/agents', $image);
            $agent->image = $image;
        }

        $agent->save();

        return redirect('back/agents/' . $agent->id . '/edit');
    }

    public function update(Request $request, $id)
    {
        $agent = Agent::findOrFail($id);

        $toValidate['name'] = 'required|max:255';

        $this->validate($request, $toValidate);

        $agent->name = $request->get('name');
        $agent->email = $request->get('email');
        $agent->phone = $request->get('phone');
        $agent->telegram = $request->get('telegram');
        $agent->job = $request->get('job');

        if ($request->image) {
            $image = uniqid() . '-' . $request->image->getClientOriginalName();
            $request->image->move('images/agents', $image);
            $agent->image = $image;
        }

        $agent->save();

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
                Agent::where('id', $id)->update(['position' => $i]);
                $i++;
            }
        }
    }

    public function destroy($id)
    {
        Agent::where('id', $id)->delete();
        return redirect()->back();
    }
}
