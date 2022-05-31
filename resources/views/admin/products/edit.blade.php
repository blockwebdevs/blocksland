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
            <li class="breadcrumb-item active" aria-current="page">Edit item</li>
        </ol>
    </nav>

    <div class="title-block">
        <h3 class="title"> Edit item
            @if (!is_null($product->category))
                [ {{ $product->category->translation->name }} ]
            @endif
        </h3>
        @include('admin.list-elements', ['actions' => [
                'Add new' => route('products.create', ['category' => Request::get('category')])
            ]
        ])
    </div>

    @include('admin.alerts')

    <div class="list-content">
        <form class="form-reg" method="POST" action="{{ route('products.update', $product->id) }}"
              enctype="multipart/form-data">
            {{ csrf_field() }} {{ method_field('PATCH') }}
            <input type="hidden" value="{{ $product->category->id }}" name="category_id">
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
                                            @foreach($product->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="name_{{ $lang->lang }}" class="name"
                                                           value="{{ $translation->name }}">
                                                @endif
                                            @endforeach
                                        </li>
                                        <li>
                                            <label>Address details [{{ $lang->lang }}]</label>
                                            @foreach($product->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="subtitle_{{ $lang->lang }}" class="name"
                                                           value="{{ $translation->subtitle }}">
                                                @endif
                                            @endforeach
                                        </li>
                                        <li class="ckeditor">
                                            <label>Description [{{ $lang->lang }}]</label>
                                            @foreach($product->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <textarea name="description_{{ $lang->lang }}">
                                                        {{  $translation->description }}
                                                    </textarea>
                                                @endif
                                            @endforeach
                                        </li>
                                        <li class="ckeditor">
                                            <label>Body [{{ $lang->lang }}]</label>
                                            @foreach($product->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <textarea name="body_{{ $lang->lang }}">
                                                        {{  $translation->body }}
                                                    </textarea>
                                                @endif
                                            @endforeach
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
                                            @foreach($product->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="meta_title_{{ $lang->lang }}"
                                                           value="{{ $translation->seo_title }}">
                                                @endif
                                            @endforeach
                                        </li>
                                        <li>
                                            <label>Seo Keywords [{{ $lang->lang }}]</label>
                                            @foreach($product->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="meta_keywords_{{ $lang->lang }}"
                                                           value="{{ $translation->seo_keywords }}">
                                                @endif
                                            @endforeach
                                        </li>
                                        <li>
                                            <label>Seo Description [{{ $lang->lang }}]</label>
                                            @foreach($product->translations as $translation)
                                                @if ($translation->lang_id == $lang->id)
                                                    <input type="text" name="meta_description_{{ $lang->lang }}"
                                                           value="{{ $translation->seo_description }}">
                                                @endif
                                            @endforeach
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
                                    <input id="active" type="checkbox" name="active" {{ $product->active == 1 ? 'checked' : '' }}>
                                    <label for="active">Active</label>
                                </span>
                                <span class="col-md-6">
                                    <input id="recommended" type="checkbox" name="recommended" {{ $product->recommended == 1 ? 'checked' : '' }}>
                                    <label for="recommended">Recommended</label>
                                </span>
                            </div>
                            <li>
                                <hr>
                                <div class="form-group">
                                    <label>Code</label>
                                    <input type="text" name="code" class="form-control" required
                                           value="{{ $product->code }}">
                                </div>
                                <div class="form-group">
                                    <label>Tag</label>
                                    <select name="tag_id" class="form-control">
                                        <option value="0">---</option>
                                        @foreach($tags as $tag)
                                            <option value="{{ $tag->id }}" {{ $product->tag_id == $tag->id ? 'selected' : '' }}>
                                                {{ $tag->translation->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Agent</label>
                                    <select name="agent_id" class="form-control">
                                        <option value="0">---</option>
                                        @foreach($agents as $agent)
                                            <option value="{{ $agent->id }}" {{ $product->agent_id == $agent->id ? 'selected' : '' }}>
                                                {{ $agent->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Price (euro)</label>
                                    <input type="number" class="form-control" name="price"
                                           value="{{ $product->price }}">
                                </div>
                                <div class="form-group">
                                    <label>
                                        Surface
                                        @if($product->category->unit && strlen($product->category->unit) > 0)
                                            ({!! $product->category->unit !!})
                                        @endif
                                    </label>
                                    <input type="number" class="form-control" name="surface"
                                           value="{{ $product->surface }}">
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
                                                    <option value="{{ $parameterValue->id }}"
                                                        {{ array_key_exists($parameter->id, $existentParameters)
&&  $existentParameters[$parameter->id]
=== $parameterValue->id ? 'selected' : ''}}>
                                                        @if($parameterValue->translation)
                                                            {{ $parameterValue->translation->name  }}
                                                        @endif
                                                    </option>
                                                @endforeach
                                            </select>
                                        @endif
                                    </div>
                                @endforeach
                                <div class="form-group">
                                    <label>Geo Location (Google Maps Iframe)</label>
                                    <textarea name="iframe" id="" cols="30" rows="8"
                                              class="form-control">{{ $product->iframe  }}</textarea>
                                </div>
                        </div>
                    </div>
                    <div class="row" id="images">
                        <hr>
                        <div class="col-md-12">
                            <h6>Upload images:</h6>
                            <div class="form-group">
                                <label for="upload">Choice images</label>
                                <input type="file" id="upload_file" name="images[]" onchange="preview_image();"
                                       multiple/>
                                <div id="image_preview">
                                    @foreach($images as $image)
                                        <div class='col-md-2 append-wrap'>
                                            <div>
                                                {{--                                                @if(!$image->main)--}}
                                                <span class="delete-image-btn {{ $image->main ? 'hide' : ''  }}">
                                                        <i class="fa fa-trash delete-btn_"
                                                           data-id="{{ $image->id }}"></i>
                                                        <span class="delimiter"></span>
                                                        <i class="fa fa-check main-btn" data-id="{{ $image->id }}"></i>
                                                    </span>
                                                {{--                                                @endif--}}
                                                <a href="{{ asset('/images/products/og/'.$image->src) }}"
                                                   data-lightbox="roadtrip">
                                                    <img src="{{ asset('/images/products/sm/'.$image->src) }}" alt="">
                                                </a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
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

            $('.main-btn').on('click', function () {
                $id = $(this).attr('data-id');
                $productId = '{{ $product->id }}';
                var el = $(this).parents('.append-wrap')
                var wrapp = $('#image_preview')
                var btns = $(this).parents('.delete-image-btn')

                $.ajax({
                    type: "POST",
                    url: '/back/products/gallery/main',
                    data: {
                        id: $id,
                        productId: $productId,
                    },
                    success: function (data) {
                        if (data === 'true') {
                            $(this).hide()
                            wrapp.prepend(el)
                            $('.delete-image-btn').removeClass('hide')
                            btns.addClass('hide')
                        }
                    }
                });
            });

            $('.delete-btn_').on('click', function () {
                let conf = confirm("Do you want delete this image?");

                if (conf != true)
                    e.preventDefault();
                else {
                    $id = $(this).attr('data-id');
                    $productId = '{{ $product->id }}';
                    var el = $(this).parents('.append-wrap')

                    $.ajax({
                        type: "POST",
                        url: '/back/products/gallery/delete',
                        data: {
                            id: $id,
                            productId: $productId,
                        },
                        success: function (data) {
                            if (data === 'true') {
                                el.remove();
                            }
                        }
                    });
                }
            });
        });
    </script>
@stop
