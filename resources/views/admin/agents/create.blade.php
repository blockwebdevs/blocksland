@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ url('/back/tags') }}">Agents</a></li>
            <li class="breadcrumb-item active" aria-current="page">Create New Agent</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Create New Agent</h3>
        @include(' admin.list-elements', ['actions' => ['Add new' => route('agents.create')]])
    </div>

    @include('admin.alerts')

    <div class="list-content">
        <form class="form-reg" method="POST" action="{{ route('agents.store') }}" enctype="multipart/form-data">
            {{ csrf_field() }}
            <div class="card">
                <div class="card-block">

                    <div class="row">
                        <div class="col-md-8">
                            <div class="tab-content active-content"
                                 id={{ $lang->lang }}>
                                <ul>
                                    <li>
                                        <label>Name</label>
                                        <input type="text" name="name" class="name" required>
                                    </li>
                                    <li>
                                        <label>Phone</label>
                                        <input type="number" name="phone" class="name" required>
                                    </li>
                                    <li>
                                        <label>Telegram</label>
                                        <input type="text" name="telergam" class="name" required>
                                    </li>
                                    <li>
                                        <label>Email</label>
                                        <input type="email" name="email" class="name" required>
                                    </li>
                                    <li>
                                        <label>Position/Job</label>
                                        <input type="text" name="job" class="name">
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="col-md-12">
                                <h6>Upload avatar:</h6>
                                <div class="form-group">
                                    <label for="upload">Choice image</label>
                                    <input type="file" id="upload_file" name="image" onchange="preview_image();"/>
                                    <div id="image_preview"></div>
                                </div>
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
