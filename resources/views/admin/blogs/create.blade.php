@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ route('blogs.index') }}">Blog</a></li>
            <li class="breadcrumb-item active" aria-current="page">Create new post</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Create new post</h3>
        @include('admin.list-elements', ['actions' => ['Add new' => route('blogs.create')]])
    </div>

    @include('admin.alerts')
    <div class="list-content">
        <div class="card">
            <div class="card-block">
                <form class="form-reg" role="form" method="POST" action="{{ route('blogs.store') }}"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
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
                                    <div class="tab-content {{ $loop->first ? ' active-content' : '' }}" id={{ $lang->lang }}><br>
                                        <div class="form-group">
                                            <label for="name-{{ $lang->lang }}">Title [{{ $lang->lang }}]</label>
                                            <input type="text" class="form-control" name="title_{{ $lang->lang }}"
                                                   id="title-{{ $lang->lang }}">
                                        </div>
                                        <div class="form-group">
                                            <label for="description-{{ $lang->lang }}">Description [{{ $lang->lang }}
                                                ]</label>
                                            <textarea name="description_{{ $lang->lang }}" class="form-control"
                                                      id="description-{{ $lang->lang }}"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="body_{{ $lang->lang }}">Body[{{ $lang->lang }}]</label>
                                            <textarea name="body_{{ $lang->lang }}" name="body_{{ $lang->lang }}"
                                                      class="form-control" id="body-{{ $lang->lang }}"></textarea>
                                            <script>
                                                CKEDITOR.replace('body-{{ $lang->lang }}', {
                                                    language: '{{$lang}}',
                                                    height: '500px',
                                                    filebrowserUploadUrl: "{{route('ckeditor.upload', ['_token' => csrf_token() ])}}",
                                                    filebrowserUploadMethod: 'form'
                                                });
                                                CKEDITOR.config.contentsCss = 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
                                            </script>
                                        </div>
                                        <hr>
                                        <div class="form-group">
                                            <label for="seo_title_{{ $lang->lang }}">Seo Title [{{ $lang->lang }}
                                                ]</label>
                                            <input type="text" name="seo_title_{{ $lang->lang }}" class="form-control"
                                                   id="seo_title_{{ $lang->lang }}">
                                        </div>
                                        <div class="form-group">
                                            <label for="seo_descr_{{ $lang->lang }}">Seo Description [{{ $lang->lang }}
                                                ]</label>
                                            <input type="text" name="seo_descr_{{ $lang->lang }}" class="form-control"
                                                   id="seo_descr_{{ $lang->lang }}">
                                        </div>
                                        <div class="form-group">
                                            <label for="seo_keywords_{{ $lang->lang }}">Seo Keywords [{{ $lang->lang }}
                                                ]</label>
                                            <input type="text" name="seo_keywords_{{ $lang->lang }}"
                                                   class="form-control" id="seo_keywords_{{ $lang->lang }}">
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                        <div class="col-md-4">
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>
                                            <input class="checkbox" type="checkbox" name="active">
                                            <span>Active</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Posted at</label>
                                        <input type="date" name="date" value="" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <hr>
                                    <h6>Upload Banner:</h6>
                                    <div class="form-group">
                                        <label for="upload">Choice image</label>
                                        <input type="file" id="upload_file" name="image" onchange="preview_image();"/>
                                        <div id="image_preview"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <input type="submit" value="Save" class="btn btn-primary">
                        </div>
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
            $('#image_preview').append(
                "<div class='append-wrap'><div>" + "<img src='" + URL.createObjectURL(event.target.files[i]) + "'>" + "</div>"
            );
        }
    }
</script>

