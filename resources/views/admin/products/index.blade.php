@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Catalog</li>
        </ol>
    </nav>
    <div class="title-block">
        <div class="row">
            <div class="col-md-6">
                <h3 class="title"> Catalog
                    @if (!is_null($category))
                        @if (!is_null($category->translation->first()))
                            [ {{ $category->translation->name }} ]
                        @endif
                    @endif
                </h3>
                @include(' admin.list-elements', [
                'actions' => [
                        'Add new' => route('products.create', ['category' => Request::segment(4)]),
                    ]
                ])
            </div>
            <div class="col-md-6">
                <form class="form-inline text-right">
                    <div class="form-group">
                        <input type="text" class="form-control" required placeholder="Search.." name="search"
                               value="{{ Request::get("search") }}">
                        <button type="submit" class="btn btn-primary mt-5">
                            <i class="fa fa-search"></i>
                        </button>
                        <a href="{{ url()->current() }}" class="btn btn-primary mt-5">
                            <i class="fa fa-close"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    @if($products->count())
        <div class="card">
            <div class="card-block">
                <table class="table table-hover table-striped" id="tablelistsorter">
                    <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center">Image</th>
                        <th>Address</th>
                        <th>Code</th>
                        <th class="text-center">Images</th>
                        <th>Position</th>
                        <th class="text-center">Active</th>
                        <th class="text-center">Edit</th>
                        <th class="text-center">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($products as $key => $product)
                        <tr id="{{ $product->id }}">
                            <td class="text-center">{{ $key + 1 }}</td>
                            <td class="text-center">
                                @if($product->mainImage)
                                    <img src="{{ asset('/images/products/sm/'. $product->mainImage->src) }}"
                                         height="50px">
                                @else
                                    <img src="{{ asset('/images/noimage.jpg') }}" height="50px">
                                @endif
                            </td>
                            <td>
                                <b> {{ $product->translation ? $product->translation->name . ' '. $product->translation->subtitle : ''}}</b>
                            </td>
                            <td><small>{{ $product->code}}</small></td>
                            <td class="text-center">
                                <span class="badge badge-primary">{{ count($product->images()->get()) }}</span>
                            </td>
                            <td class="dragHandle" nowrap style="cursor: move;">
                                <a class="top-pos" href=""><i class="fa fa-arrow-up"></i></a>
                                <a class="bottom-pos" href=""><i class="fa fa-arrow-down"></i></a>
                            </td>
                            <td class="text-center">
                                @if($product->active)
                                    <i class="fa fa-plus"></i>
                                @else
                                    <i class="fa fa-minus"></i>
                                @endif
                            </td>
                            <td class="text-center">
                                <a href="{{ route('products.edit', $product->id).'?category='.$product->category_id }}">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                            <td class="destroy-element text-center">
                                <form action="{{ route('products.destroy', $product->id) }}" method="post">
                                    {{ csrf_field() }} {{ method_field('DELETE') }}
                                    <button type="submit" class="btn-link">
                                        <a>
                                            <i class="fa fa-trash"></i>
                                        </a>
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
        <div class="empty-response">{{trans('variables.list_is_empty')}}</div>
    @endif
@stop

<style>
    table td {
        vertical-align: middle !important;
    }

    .mt-5 {
        margin-top: 5px;
    }
</style>
