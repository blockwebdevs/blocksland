@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ url('/back/testimonials') }}">Testimonials</a></li>
            <li class="breadcrumb-item active" aria-current="page">Edit Testimonial</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Edit Testimonial</h3>
        @include(' admin.list-elements', ['actions' => ['Add new' => route('testimonials.create')]])
    </div>

    @include('admin.alerts')

    <div class="list-content">
        <form class="form-reg" method="POST" action="{{ route('testimonials.update', $testimonial->id) }}" enctype="multipart/form-data">
            {{ csrf_field() }} {{ method_field('PATCH') }}
            <div class="card">
                <div class="card-block">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="tab-content active-content"
                                 id={{ $lang->lang }}>
                                <ul>
                                    <li>
                                        <label>Title</label>
                                        <input type="text" name="title" class="name" value="{{ $testimonial->title }}">
                                    </li>
                                    <li>
                                        <label>Testimonial</label>
                                        <textarea name="body" id="" cols="30" rows="10" class="name" required>
                                            {{ $testimonial->body }}
                                        </textarea>
                                    </li>
                                    <li>
                                        <label>Author</label>
                                        <input type="text" name="author" class="name" value="{{ $testimonial->author }}" required>
                                    </li>
                                </ul>
                            </div>
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
