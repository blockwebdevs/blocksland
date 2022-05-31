@extends(' admin.app')
@include(' admin.nav-bar')
@include(' admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ route('pages.index') }}">Pages</a></li>
            <li class="breadcrumb-item active" aria-current="page">Edit page</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title"> Edit page </h3>
        @include('admin.list-elements', ['actions' => ["Add new" => route('pages.create')]])
    </div>
    @include(' admin.alerts')

    <div class="list-content">
        <div class="card">
            <div class="card-block">
                <form class="form-reg" role="form" method="POST" action="{{ route('pages.update', $page->id) }}"
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
                                        @foreach($page->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label for="name-{{ $lang->lang }}">Title [{{ $lang->lang }}
                                                        ]</label>
                                                    <input type="text" name="title_{{ $lang->lang }}"
                                                           class="form-control" value="{{ $translation->title }}">
                                                </div>
                                            @endif
                                        @endforeach
                                        @foreach($page->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="ckeditor form-group">
                                                    <label>Description [{{ $lang->lang }}]</label>
                                                    <textarea name="description_{{ $lang->lang }}"
                                                              class="form-control">{!! $translation->description !!}</textarea>
                                                </div>
                                            @endif
                                        @endforeach
                                        @foreach($page->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="ckeditor form-group">
                                                    <label for="body-{{ $lang->lang }}">Body [{{ $lang->lang }}]</label>
                                                    <textarea name="body_{{ $lang->lang }}" id="body-{{ $lang->lang }}"
                                                              data-type="ckeditor">{!! $translation->body !!}</textarea>
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
                                            @endif
                                        @endforeach
                                        <hr>
                                        @foreach($page->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label>Seo Title [{{ $lang->lang }}]</label>
                                                    <input type="text" name="meta_title_{{ $lang->lang }}"
                                                           class="form-control" value="{{ $translation->meta_title }}">
                                                </div>
                                            @endif
                                        @endforeach
                                        @foreach($page->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label>Seo Keywords [{{ $lang->lang }}]</label>
                                                    <input type="text" name="meta_keywords_{{ $lang->lang }}"
                                                           class="form-control"
                                                           value="{{ $translation->meta_keywords }}">
                                                </div>
                                            @endif
                                        @endforeach
                                        @foreach($page->translations as $translation)
                                            @if($translation->lang_id == $lang->id && !is_null($translation->lang_id))
                                                <div class="form-group">
                                                    <label>Seo Title [{{ $lang->lang }}]</label>
                                                    <input type="text" name="meta_description_{{ $lang->lang }}"
                                                           class="form-control"
                                                           value="{{ $translation->meta_description }}">
                                                </div>
                                            @endif
                                        @endforeach
                                    </div>
                                @endforeach
                            @endif
                        </div>
                        <div class="col-md-4">
                            <hr>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" name="on_header" {{ $page->on_header ? 'checked' : '' }}>
                                        <span>Display Header</span>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" name="on_footer" {{ $page->on_footer ? 'checked' : '' }}>
                                        <span>Display Footer</span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <hr>
                                <h6>Upload banner:</h6>
                                <div class="form-group">
                                    <label for="upload">Choice image</label>
                                    <input type="file" id="upload_file" name="image" onchange="preview_image();"/>
                                    <div id="image_preview">
                                        @if($page->image)
                                            <div class='append-wrap'>
                                                <div>
                                                    <img src="{{ asset('/images/pages/' . $page->image) }}" alt="">
                                                </div>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <input type="submit" class="btn btn-primary" value="{{trans('variables.save_it')}}"
                                   data-form-id="add-form">
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
            $('#image_preview').html(
                "<div class='append-wrap'><div>" + "<img src='" + URL.createObjectURL(event.target.files[i]) + "'>" + "</div>"
            );
        }
    }
</script>
