@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item">
                <a href="{{ route('products.category', ['category' => Request::get('category')]) }}">
                    Catalog
                </a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">Create new</li>
        </ol>
    </nav>

    <div class="title-block">
        <h3 class="title"> Create new
            @if (!is_null($category))
                [ {{ $category->translation->name }} ]
            @endif
        </h3>
        @include('admin.list-elements', ['actions' => ['Add new' => route('products.create', ['category' => Request::get('category')])]])
    </div>

    @include('admin.alerts')

    <div class="list-content">
        <form class="form-reg" method="POST" action="{{ route('products.store') }}" enctype="multipart/form-data">
            {{ csrf_field() }}
            <input type="hidden" value="{{ $category->id }}" name="category_id">
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
                                            <label>Address [{{ $lang->lang }}]</label>
                                            <input type="text" name="name_{{ $lang->lang }}" class="name"
                                                   data-lang="{{ $lang->lang }}">
                                        </li>
                                        <li>
                                            <label>Address details [{{ $lang->lang }}]</label>
                                            <input type="text" name="subtitle_{{ $lang->lang }}" class="name"
                                                   data-lang="{{ $lang->lang }}">
                                        </li>
                                        <li class="ckeditor">
                                            <label>Description [{{ $lang->lang }}]</label>
                                            <textarea name="description_{{ $lang->lang }}"></textarea>
                                        </li>
                                        <li class="ckeditor">
                                            <label>Body [{{ $lang->lang }}]</label>
                                            <textarea name="body_{{ $lang->lang }}"></textarea>
                                            <script>
                                                CKEDITOR.replace('body_{{ $lang->lang }}', {
                                                    language: '{{$lang}}',
                                                    height: '500px',
                                                    filebrowserUploadUrl: "{{route('ckeditor.upload', ['_token' => csrf_token() ])}}",
                                                    filebrowserUploadMethod: 'form'
                                                });
                                                CKEDITOR.config.contentsCss = 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
                                            </script>
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
                                    </ul>
                                </div>
                            @endforeach
                        </div>
                        <div class="col-md-4">
                            <input type="submit" value="Save" class="btn btn-primary">
                            <hr>
                            <div class="form-group row text-center">
                                <span class="col-md-4">
                                    <input id="active" type="checkbox" name="active">
                                    <label for="active">Active</label>
                                </span>
                                <span class="col-md-6">
                                    <input id="recommended" type="checkbox" name="recommended">
                                    <label for="recommended">Recommended</label>
                                </span>
                            </div>
                            <li>
                                <hr>
                                <div class="form-group">
                                    <label>Code</label>
                                    <input type="text" name="code" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Tag</label>
                                    <select name="tag_id" class="form-control">
                                        <option value="0">---</option>
                                        @foreach($tags as $tag)
                                            <option value="{{ $tag->id }}">{{ $tag->translation->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Agent</label>
                                    <select name="agent_id" class="form-control">
                                        <option value="0">---</option>
                                        @foreach($agents as $agent)
                                            <option value="{{ $agent->id }}">{{ $agent->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Price (euro)</label>
                                    <input type="number" class="form-control" name="price">
                                </div>
                                <div class="form-group">
                                    <label>
                                        Surface
                                        @if($category->unit && strlen($category->unit) > 0)
                                            ({!! $category->unit !!})
                                        @endif
                                    </label>
                                    <input type="number" class="form-control" name="surface">
                                </div>
                                @foreach($parameters as $parameter)
                                    <div class="form-group">
                                        <label
                                            for="param_{{ $parameter->id }}">{{ $parameter->translation->name  }}</label>
                                        @if($parameter->type == 'checkbox')
                                            <select class="form-control" id="param_{{ $parameter->id }}"
                                                    name="params[{{$parameter->id}}]">
                                                <option value="">---</option>
                                                @foreach($parameter->parameterValues as $parameterValue)
                                                    <option value="{{ $parameterValue->id }}">
                                                        @if($parameterValue->translation)
                                                            {{ $parameterValue->translation->name  }}
                                                        @else
                                                            {{ $parameterValue  }}
                                                        @endif
                                                    </option>
                                                @endforeach
                                            </select>
                                        @endif
                                    </div>
                                @endforeach
                                <div class="form-group">
                                    <label>Geo Location (Google Maps Iframe)</label>
                                    <textarea name="iframe" id="" cols="30" rows="8" class="form-control"></textarea>
                                </div>
                        </div>
                    </div>
                    <div class="row">
                        <hr>
                        <div class="col-md-12">
                            <h6>Upload images:</h6>
                            <div class="form-group">
                                <label for="upload">Choice images</label>
                                <input type="file" id="upload_file" name="images[]" onchange="preview_image();"
                                       multiple/>
                                <div id="image_preview"></div>
                            </div>
                        </div>
                        <div class="col-md-8"></div>
                    </div>
                    <div class="col-md-12 text-center">
                        <input type="submit" value="Save" class="btn btn-primary">
                    </div>
                </div>
            </div>
        </form>
    </div>
@stop

<script>
    function preview_image() {
        var total_file = document.getElementById("upload_file").files.length;
        for (var i = 0; i < total_file; i++) {
            $('#image_preview').append(
                "<div class='col-md-2 append-wrap'><div>" + "<img src='" + URL.createObjectURL(event.target.files[i]) + "'>" + "</div>"
            );
        }
    }

    $().ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-Token': $('meta[name="_token"]').attr('content')
            }
        });
    });
</script>

<style>
    .append-wrap {
        height: 180px;
        border: 1px solid #EEE;
        border-radius: 5px;
        margin: 5px 15px;
        align-items: center;
        display: flex;
        justify-content: center;
        overflow: hidden;
        padding: 0;
    }

    .append-wrap img {
        width: 100%;
    }
</style>
