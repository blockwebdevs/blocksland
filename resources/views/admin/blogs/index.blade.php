@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item active" aria-current="blog">Blog</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Blog</h3>
        @include('admin.list-elements', ['actions' => ['Add new' => route('blogs.create')]])
    </div>

    @include('admin.alerts')

    @if(!$blogs->isEmpty())
        <div class="card">
            <div class="card-block">
                <table class="table table-hover table-striped" id="tablelistsorter">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th class="text-center">Banner</th>
                        <th>Title</th>
                        <th>Position</th>
                        <th>Active</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($blogs as $key => $blog)
                        <tr id="{{ $blog->id }}">
                            <td>
                                {{ $key + 1 }}
                            </td>
                            <td class="text-center">
                                @if($blog->image)
                                    <img src="{{ asset('/images/blogs/'. $blog->image)  }}" height="50px">
                                @else
                                    <img src="{{ asset('/images/noimage.jpg')  }}" height="50px">
                                @endif
                            </td>
                            <td>
                                <b>{{ $blog->translation()->first()->name ?? trans('variables.another_name') }}</b>
                            </td>
                            <td class="dragHandle" nowrap style="cursor: move;">
                                <a class="top-pos" href=""><i class="fa fa-arrow-up"></i></a>
                                <a class="bottom-pos" href=""><i class="fa fa-arrow-down"></i></a>
                            </td>
                            <td>
                                <form action="{{ route('blogs.change.status', $blog->id) }}" method="post">
                                    {{ csrf_field() }} {{ method_field('PATCH') }}
                                    <button type="submit" class="btn-link">
                                        <a href="" class="change-active {{ $blog->active == 1 ? '' : 'negative' }}">
                                            <i class="fa fa-{{ $blog->active == 1 ? 'plus' : 'minus' }}"></i>
                                        </a>
                                    </button>
                                </form>
                            </td>
                            <td>
                                <a href="{{ route('blogs.edit', $blog->id) }}">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                            <td class="destroy-element">
                                <form action="{{ route('blogs.destroy', $blog->id) }}" method="post">
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
        <div class="empty-response">List is empty</div>
    @endif
@stop

<style>
    table td {
        vertical-align: middle !important;
    }
</style>

