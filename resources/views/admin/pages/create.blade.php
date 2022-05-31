@extends(' admin.app')
@include(' admin.nav-bar')
@include(' admin.left-menu')
@section('content')
    
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ route('pages.index') }}">Pages</a></li>
            <li class="breadcrumb-item active" aria-current="page">Create Page</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title"> Create Page </h3>
        @include(' admin.list-elements', ['actions' => ["Add new" => route('pages.create')]])
    </div>

    @include(' admin.alerts')

    <div class="list-content">
        <div class="card">
            <div class="card-block">
                <form class="form-reg" role="form" method="POST" action="{{ route('pages.store') }}" id="add-form"
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
                                    <div class="tab-content {{ $loop->first ? ' active-content' : '' }}"
                                         id={{ $lang->lang }}>
                                        <div class="form-group">
                                            <label for="name-{{ $lang->lang }}">Title [{{ $lang->lang }}]</label>
                                            <input type="text" name="title_{{ $lang->lang }}" class="form-control">
                                        </div>
                                        <div class=" form-group">
                                            <label for="descr-{{ $lang->lang }}">Description [{{ $lang->lang }}]</label>
                                            <textarea name="descr_{{ $lang->lang }}" class="form-control"></textarea>
                                        </div>
                                        <div class="ckeditor form-group">
                                            <label for="body-{{ $lang->lang }}">Body [{{ $lang->lang }}]</label>
                                            <textarea name="body_{{ $lang->lang }}" id="body-{{ $lang->lang }}"
                                                      data-type="ckeditor" class="form-control"></textarea>
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
                                            <label for="meta_title_{{ $lang->lang }}">Seo title [{{ $lang->lang }}
                                                ]</label>
                                            <input type="text" name="meta_title_{{ $lang->lang }}" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="meta_keywords_{{ $lang->lang }}">Seo Keyword[{{ $lang->lang }}
                                                ]</label>
                                            <input type="text" name="meta_keywords_{{ $lang->lang }}"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="meta_description_{{ $lang->lang }}">Seo Description
                                                [{{ $lang->lang }}]</label>
                                            <input type="text" name="meta_description_{{ $lang->lang }}"
                                                   class="form-control">
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                        <div class="col-md-4">
                            <hr>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" name="on_header">
                                        <span>Display Header</span>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" name="on_footer">
                                        <span>Display Footer</span>
                                    </label>
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
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="submit" value="Save" class="btn btn-primary">
                            </div>
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
