@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ url('/back/tags') }}">Tags</a></li>
            <li class="breadcrumb-item active" aria-current="page">Edit Tag</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Edit Tag</h3>
        @include(' admin.list-elements', ['actions' => ['Add new' => route('tags.create')]])
    </div>

    @include('admin.alerts')

    <div class="list-content">
        <form class="form-reg" method="POST" action="{{ route('tags.update', $tag->id) }}"
              enctype="multipart/form-data">
            {{ csrf_field() }} {{ method_field('PATCH') }}
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
                        <div class="col-md-8">
                            @foreach ($langs as $lang)
                                <div class="tab-content {{ $loop->first ? ' active-content' : '' }}"
                                     id={{ $lang->lang }}>
                                    <ul>
                                        <li>
                                            <label>Title [{{ $lang->lang }}]</label>
                                            @foreach($tag->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="name_{{ $lang->lang }}" class="name"
                                                           value="{{ $translation->name }}">
                                                @endif
                                            @endforeach
                                        </li>
                                        <hr>
                                        <h6>Seo texts:</h6>
                                        <li>
                                            <label>Seo Title [{{ $lang->lang }}]</label>
                                            @foreach($tag->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="meta_title_{{ $lang->lang }}"
                                                           value="{{ $translation->seo_title }}">
                                                @endif
                                            @endforeach
                                        </li>
                                        <li>
                                            <label>Seo Keywords [{{ $lang->lang }}]</label>
                                            @foreach($tag->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="meta_keywords_{{ $lang->lang }}"
                                                           value="{{ $translation->seo_keywords }}">
                                                @endif
                                            @endforeach
                                        </li>
                                        <li>
                                            <label>Seo Description [{{ $lang->lang }}]</label>
                                            @foreach($tag->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="meta_description_{{ $lang->lang }}"
                                                           value="{{ $translation->seo_description }}">
                                                @endif
                                            @endforeach
                                        </li>
                                        <li>
                                            <label>Seo Text [{{ $lang->lang }}]</label>
                                            @foreach($tag->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <textarea name="seo_text_{{ $lang->lang }}">
                                                        {{ $translation->seo_text }}
                                                    </textarea>
                                                @endif
                                            @endforeach
                                        </li>
                                    </ul>
                                </div>
                            @endforeach
                        </div>
                        <div class="col-md-4">
                            <hr>
                            <h6>Associated objects ({{ $tag->products->count() }}):</h6>
                            @if($tag->products)
                                <ol>
                                    @foreach($tag->products as $key => $product)
                                        <a href="{{url('/back/products/'. $product->id . '/edit?category=' . $product->category_id)}}">
                                            <b><li>{{ $key + 1 }} | {{ $product->translation->name }} <small>[{{ $product->code }}]</small></li></b>
                                        </a>
                                    @endforeach
                                </ol>
                            @endif
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

<style>
    ol li {
        padding: 10px 0;
    }
</style>
