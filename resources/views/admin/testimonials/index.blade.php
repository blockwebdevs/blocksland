@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Testimonials</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Testimonials</h3>
        @include(' admin.list-elements', ['actions' => ['Add new' => route('testimonials.create')]])
    </div>

    @if($testimonials->count())
        <div class="card">
            <div class="card-block">
                <table class="table table-hover table-striped" id="tablelistsorter">
                    <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Position</th>
                        <th class="text-center">Edit</th>
                        <th class="text-center">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($testimonials as $key => $testimonial)
                        <tr id="{{ $testimonial->id }}">
                            <td class="text-center">{{ $key + 1 }}</td>
                            <td>
                                <b> {{ $testimonial->title }}</b>
                            </td>
                            <td>
                                <b> {{ $testimonial->author }}</b>
                            </td>
                            <td class="dragHandle" nowrap style="cursor: move;">
                                <a class="top-pos" href=""><i class="fa fa-arrow-up"></i></a>
                                <a class="bottom-pos" href=""><i class="fa fa-arrow-down"></i></a>
                            </td>
                            <td class="text-center">
                                <a href="{{ route('testimonials.edit', $testimonial->id) }}">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                            <td class="destroy-element text-center">
                                <form action="{{ route('testimonials.destroy', $testimonial->id) }}" method="post">
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
