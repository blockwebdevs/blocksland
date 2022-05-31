@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <div id="cover">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
                <li class="breadcrumb-item"><a href="{{ route('parameters.index') }}">Parameters</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit Parameter</li>
            </ol>
        </nav>
        <div class="title-block">
            <h3 class="title"> Edit Parameter </h3>
            @include('admin.list-elements', [
            'actions' => [
                    'Add new' => route('parameters.create'),
                ]
            ])
        </div>
        @include('admin.alerts')
        <div class="list-content">

            <edit-parameter :langs="{{ $langs }}"
                            :lang="{{ $lang }}"
                            :parameter="{{ $parameter }}"
                            :categories="{{ $categories }}"
            >
            </edit-parameter>


        </div>
    </div>

    <script src="{{asset('admin/js/app_admin.js?'.uniqid())}}"></script>

@stop
