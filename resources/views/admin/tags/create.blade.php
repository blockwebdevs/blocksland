@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ url('/back/tags') }}">Tags</a></li>
            <li class="breadcrumb-item active" aria-current="page">Create New Tag</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Create New Tag</h3>
        @include(' admin.list-elements', ['actions' => ['Add new' => route('tags.create')]])
    </div>

    @include('admin.alerts')

    <div class="list-content">
        <form class="form-reg" method="POST" action="{{ route('tags.store') }}" enctype="multipart/form-data">
            {{ csrf_field() }}
            <div class="card">
                <div class="card-block">
                    <div class="tab-area">
                        <ul class="nav nav-tabs nav-tabs-bordered">
                            @foreach ($langs as $key => $lang)
                                <li class="nav-item">
                                    <a href="#{{ $lang->lang }}"
                                       class="nav-link  {{ $key == 0 ? ' open active' : '' }}"
                                       data-target="#{{ $lang->lang }}">{{ $lang->lang }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            @foreach ($langs as $lang)
                                <div class="tab-content {{ $loop->first ? ' active-content' : '' }}"
                                     id={{ $lang->lang }}>
                                    <ul>
                                        <li>
                                            <label>Title [{{ $lang->lang }}]</label>
                                            <input type="text" name="name_{{ $lang->lang }}" class="name"
                                                   data-lang="{{ $lang->lang }}">
                                        </li>
                                        <hr>
                                        <h6>Seo texts:</h6>
                                        <li>
                                            <label>Seo Title [{{ $lang->lang }}]</label>
                                            <input type="text" name="meta_title_{{ $lang->lang }}">
                                        </li>
                                        <li>
                                            <label>Seo Keywords [{{ $lang->lang }}]</label>
                                            <input type="text" name="meta_keywords_{{ $lang->lang }}">
                                        </li>
                                        <li>
                                            <label>Seo Description [{{ $lang->lang }}]</label>
                                            <input type="text" name="meta_description_{{ $lang->lang }}">
                                        </li>
                                        <li>
                                            <label>Seo Text [{{ $lang->lang }}]</label>
                                            <textarea name="seo_text_{{ $lang->lang }}"></textarea>
                                        </li>
                                    </ul>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="col-md-12 text-center">
                        <input type="submit" value="Save" class="btn btn-primary">
                    </div>
                </div>
            </div>
        </form>
    </div>
@stop
