@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ route('product-categories.index') }}">Product Categories</a></li>
            <li class="breadcrumb-item active" aria-current="page">Edit Category</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title"> Edit Category </h3>
    </div>

    @include('admin.alerts')

    <div class="card">
        <div class="card-block">
            <div class="row">
                <form class="form-reg" method="post" action="{{ route('product-categories.update', $category->id) }}"
                      enctype="multipart/form-data">
                    {{ csrf_field() }} {{ method_field('PATCH') }}
                    <div class="col-md-8">
                        <div class="tab-area">
                            <ul class="nav nav-tabs nav-tabs-bordered">
                                @foreach ($langs as $key => $lang)
                                    <li class="nav-item">
                                        <a href="#{{ $lang->lang }}"
                                           class="nav-link  {{ $key == 0 ? ' open active' : '' }}"
                                           data-target="#{{ $lang->lang }}">{{ $lang->lang }}</a>
                                    </li>
                                @endforeach
                            </ul>

                            <input type="hidden" name="dependable-status" value="false">
                            <input type="hidden" name="submit-status" value="false">

                            @foreach ($langs as $key => $lang)
                                <div class="tab-content {{ $key == 0 ? ' active-content' : '' }}" id={{ $lang->lang }}>
                                    <div class="part full-part">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Title[{{ $lang->lang }}]</label>
                                                    <input type="text" name="name_{{ $lang->lang }}"
                                                           class="form-control"
                                                           @foreach($category->translations as $translation) @if ($translation->lang_id == $lang->id) value="{{ $translation->name }}"@endif @endforeach >
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label>Description[{{ $lang->lang }}]</label>
                                                @foreach($category->translations as $translation)
                                                    @if($translation->lang_id == $lang->id)
                                                        <textarea name="description_{{ $lang->lang }}"
                                                                  class="form-control" id="body-{{ $lang->lang }}"
                                                                  data-type="ckeditor">{{ $translation->description }}
                                                        </textarea>
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
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label>Seo Title[{{ $lang->lang }}]</label>
                                                <input type="text" name="seo_title_{{ $lang->lang }}"
                                                       class="form-control"
                                                       @foreach($category->translations as $translation) @if ($translation->lang_id == $lang->id) value="{{ $translation->seo_title }}"@endif @endforeach>
                                            </div>
                                            <div class="col-md-12">
                                                <label>Seo Description[{{ $lang->lang }}]</label>
                                                <input type="text"
                                                       name="seo_description_{{ $lang->lang }}"
                                                       class="form-control"
                                                       @foreach($category->translations as $translation)@if ($translation->lang_id == $lang->id)value="{{ $translation->seo_description }}" @endif @endforeach>
                                            </div>
                                            <div class="col-md-12">
                                                <label>Seo Keywords[{{ $lang->lang }}]</label>
                                                <input type="text"
                                                       name="seo_keywords_{{ $lang->lang }}"
                                                       class="form-control"
                                                       @foreach($category->translations as $translation)@if ($translation->lang_id == $lang->id)value="{{ $translation->seo_keywords }}" @endif @endforeach
                                                >
                                            </div>
                                            <div class="col-md-12">
                                                <label>Seo Text[{{ $lang->lang }}]</label>
                                                <textarea name="seo_text_{{ $lang->lang }}" height="300"
                                                          class="form-control">@foreach($category->translations as $translation)@if($translation->lang_id == $lang->id){{ $translation->seo_text }}@endif @endforeach</textarea>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="col-md-12"><br><br></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Surface Unit</label>
                                <input type="text" name="unit" value="{{ $category->unit }}" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Link Filter Sale</label>
                                <input type="text" name="link_sale" value="{{ $category->link_sale }}" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Link Filter Rent</label>
                                <input type="text" name="link_rent" value="{{ $category->link_rent }}" class="form-control">
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label>
                                    <input class="checkbox" type="checkbox"
                                           name="active" {{ $category->active == 1 ? 'checked' : ''}}>
                                    <span>Active</span>
                                </label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <h6>Upload banner:</h6>
                            <div class="form-group">
                                <label for="upload">Choice image</label>
                                <input type="file" id="upload_file" name="icon" onchange="preview_image();"/>
                                <div id="image_preview">
                                    @if($category->icon)
                                        <div class='append-wrap'>
                                            <div>
                                                <img src="{{ asset('/images/categories/sm/' . $category->icon) }}">
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row text-center">
                        <div class="col-md-12"><br>
                            <hr>
                            <input type="submit" class="btn btn-primary" value="Save" class="submit">
                        </div>
                    </div>
                </form>
            </div>
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
