@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ route('blogs.index') }}">Blog</a></li>
            <li class="breadcrumb-item active" aria-current="blog">Edit post</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Edit post </h3>
        @include(' admin.list-elements', ['actions' => ["Add new" => route('blogs.create')]])

    </div>
    @include('admin.alerts')
    <div class="list-content">
        <div class="card">
            <div class="card-block">
                <form class="form-reg" role="form" method="POST" action="{{ route('blogs.update', $blog->id) }}"
                      id="add-form" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    {{ method_field('PATCH') }}
                    <div class="row">
                        <div class="col-md-8">
                            <div class="tab-area">
                                <ul class="nav nav-tabs nav-tabs-bordered">
                                    @if (!empty($langs))
                                        @foreach ($langs as $lang)
                                            <li class="nav-item">
                                                <a href="#{{ $lang->lang }}"
                                                   class="nav-link  {{ $loop->first ? ' open active' : '' }}"
                                                   data-target="#{{ $lang->lang }}">{{ $lang->lang }}</a>
                                            </li>
                                        @endforeach
                                    @endif
                                </ul>
                            </div>
                            @if (!empty($langs))
                                @foreach ($langs as $lang)
                                    <div class="tab-content {{ $loop->first ? ' active-content' : '' }}"
                                         id={{ $lang->lang }}>
                                        @foreach($blog->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label for="name-{{ $lang->lang }}">Title [{{ $lang->lang }}
                                                        ]</label>
                                                    <input type="text" name="title_{{ $lang->lang }}"
                                                           class="form-control" value="{{ $translation->name }}">
                                                </div>
                                            @endif
                                        @endforeach
                                        @foreach($blog->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label for="descr-{{ $lang->lang }}">Description [{{ $lang->lang }}
                                                        ]</label>
                                                    <textarea name="description_{{ $lang->lang }}"
                                                              class="form-control">{{ $translation->description }}</textarea>
                                                </div>
                                            @endif
                                        @endforeach
                                        @foreach($blog->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label for="body_{{ $lang->lang }}">Body [{{ $lang->lang }}]</label>
                                                    <textarea name="body_{{ $lang->lang }}" id="body-{{ $lang->lang }}"
                                                              class="form-control">{{ $translation->body }}</textarea>
                                                </div>
                                                <script>
                                                    CKEDITOR.replace('body-{{ $lang->lang }}', {
                                                        language: '{{$lang}}',
                                                        height: '500px',
                                                        filebrowserUploadUrl: "{{route('ckeditor.upload', ['_token' => csrf_token() ])}}",
                                                        filebrowserUploadMethod: 'form'
                                                    });
                                                    CKEDITOR.config.contentsCss = 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
                                                </script>
                                            @endif
                                        @endforeach
                                        <hr>
                                        @foreach($blog->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label for="meta_title_{{ $lang->lang }}">Seo Title
                                                        [{{ $lang->lang }}]</label>
                                                    <input type="text" name="seo_title_{{ $lang->lang }}"
                                                           class="form-control" value="{{ $translation->seo_title }}">
                                                </div>
                                            @endif
                                        @endforeach
                                        @foreach($blog->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label for="seo_descr_{{ $lang->lang }}">Seo Description
                                                        [{{ $lang->lang }}]</label>
                                                    <input type="text" name="seo_descr_{{ $lang->lang }}"
                                                           class="form-control" value="{{ $translation->seo_description }}">
                                                </div>
                                            @endif
                                        @endforeach
                                        @foreach($blog->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label for="seo_keywords_{{ $lang->lang }}">Seo Keywords
                                                        [{{ $lang->lang }}]</label>
                                                    <input type="text" name="seo_keywords_{{ $lang->lang }}"
                                                           class="form-control"
                                                           value="{{ $translation->seo_keywords }}">
                                                </div>
                                            @endif
                                        @endforeach
                                    </div>
                                @endforeach
                            @endif
                        </div>
                        <div class="col-md-4">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>
                                        <input class="checkbox" type="checkbox"
                                               name="active" {{ $blog->active ? 'checked' : '' }}>
                                        <span>Active</span>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="">Posted at</label>
                                    <input type="date" name="date"
                                           value="{{ date('Y-m-d', strtotime($blog->date_time)) }}"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <hr>
                                <h6>Upload banner:</h6>
                                <div class="form-group">
                                    <label for="upload">Choice image</label>
                                    <input type="file" id="upload_file" name="image" onchange="preview_image();"/>
                                    <div id="image_preview">
                                        @if($blog->image)
                                            <div class='append-wrap'>
                                                <div>
                                                    <img src="{{ asset('/images/blogs/' . $blog->image) }}" alt="">
                                                </div>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Save" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop
<script>
    function preview_image() {
        var total_file = document.getElementById("upload_file").files.length;
        for (var i = 0; i < total_file; i++) {
            $('#image_preview').html(
                "<div class='append-wrap'><div>" + "<img src='" + URL.createObjectURL(event.target.files[i]) + "'>" + "</div>"
            );
        }
    }
</script>
