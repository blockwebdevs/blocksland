@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Pages</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title"> Pages </h3>
        @include('admin.list-elements', ['actions' => ['Add new' => route('pages.create')]])
    </div>
    @include(' admin.alerts')

    @if(!$pages->isEmpty())
        <div class="card">
            <div class="card-block">
                <table class="table table-hover table-striped" id="tablelistsorter">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Position</th>
                        <th>Active</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($pages as $key => $page)
                        <tr id="{{ $page->id }}">
                            <td>
                                {{ $key + 1 }}
                            </td>
                            <td>
                                <b>{{ $page->translation->title ?? trans('variables.another_name') }}</b>
                            </td>
                            <td class="dragHandle" nowrap style="cursor: move;">
                                <a class="top-pos" href=""><i class="fa fa-arrow-up"></i></a>
                                <a class="bottom-pos" href=""><i class="fa fa-arrow-down"></i></a>
                            </td>
                            <td>
                                <form action="{{ route('pages.change.status', $page->id) }}" method="post">
                                    {{ csrf_field() }} {{ method_field('PATCH') }}
                                    <button type="submit" class="btn-link">
                                        <a href="" class="change-active {{ $page->active == 1 ? '' : 'negative' }}">
                                            <i class="fa fa-{{ $page->active == 1 ? 'plus' : 'minus' }}"></i>
                                        </a>
                                    </button>
                                </form>
                            </td>
                            <td>
                                <a href="{{ route('pages.edit', $page->id) }}">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                            <td class="destroy-element">
                                <form action="{{ route('pages.destroy', $page->id) }}" method="post">
                                    {{ csrf_field() }} {{ method_field('DELETE') }}
                                    <button type="submit" class="btn-link">
                                        <a href=""><i class="fa fa-trash"></i></a>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan=7></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    @else
        <div class="empty-response">{{trans('variables.list_is_empty')}}</div>
    @endif
@stop
