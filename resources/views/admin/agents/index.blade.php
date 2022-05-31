@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Agents</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Agents</h3>
        @include(' admin.list-elements', ['actions' => ['Add new' => route('agents.create')]])
    </div>

    @if($agents->count())
        <div class="card">
            <div class="card-block">
                <table class="table table-hover table-striped" id="tablelistsorter">
                    <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center">Avatar</th>
                        <th>Title</th>
                        <th class="text-center">Objects</th>
                        <th>Position</th>
                        <th class="text-center">Edit</th>
                        <th class="text-center">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($agents as $key => $agent)
                        <tr id="{{ $agent->id }}">
                            <td class="text-center">{{ $key + 1 }}</td>
                            <td class="text-center">
                                @if($agent->image)
                                    <img src="{{ asset('/images/agents/' . $agent->image) }}" height="50px">
                                @else
                                    <img src="{{ asset('/images/noimage.jpg') }}" height="50px">
                                @endif
                            </td>
                            <td>
                                <b> {{ $agent->name }}</b>
                            </td>
                            <td class="text-center">
                                <span class="badge badge-primary">{{ $agent->products->count() }}</span>
                            </td>
                            <td class="dragHandle" nowrap style="cursor: move;">
                                <a class="top-pos" href=""><i class="fa fa-arrow-up"></i></a>
                                <a class="bottom-pos" href=""><i class="fa fa-arrow-down"></i></a>
                            </td>
                            <td class="text-center">
                                <a href="{{ route('agents.edit', $agent->id) }}">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                            <td class="destroy-element text-center">
                                <form action="{{ route('agents.destroy', $agent->id) }}" method="post">
                                    {{ csrf_field() }} {{ method_field('DELETE') }}
                                    <button type="submit" class="btn-link">
                                        <a><i class="fa fa-trash"></i></a>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan=10></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    @else
        <div class="empty-response">List is empty</div>
    @endif
@stop

<style>
    table td {
        vertical-align: middle !important;
    }
</style>
