@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ url('/back/agents') }}">Agents</a></li>
            <li class="breadcrumb-item active" aria-current="page">Edit Agent</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Edit Agent</h3>
        @include(' admin.list-elements', ['actions' => ['Add new' => route('agents.create')]])
    </div>

    @include('admin.alerts')

    <div class="list-content">
        <form class="form-reg" method="POST" action="{{ route('agents.update', $agent->id) }}"
              enctype="multipart/form-data">
            {{ csrf_field() }} {{ method_field('PATCH') }}
            <div class="card">
                <div class="card-block">

                    <div class="row">
                        <div class="col-md-8">
                            <div class="tab-content active-content">
                                <ul>
                                    <li>
                                        <label>Name</label>
                                        <input type="text" name="name" class="name" value="{{ $agent->name }}">
                                    </li>
                                    <li>
                                        <label>Phone</label>
                                        <input type="number" name="phone" class="name" value="{{ $agent->phone }}">
                                    </li>
                                    <li>
                                        <label>Telegram</label>
                                        <input type="text" name="telegram" class="name" value="{{ $agent->telegram }}">
                                    </li>
                                    <li>
                                        <label>Email</label>
                                        <input type="email" name="email" class="name" value="{{ $agent->email }}">
                                    </li>
                                    <li>
                                        <label>Position/Job</label>
                                        <input type="text" name="job" class="name" value="{{ $agent->job }}">
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
                                    <div id="image_preview">
                                        @if($agent->image)
                                            <div class='append-wrap' style="height: auto">
                                                <div>
                                                    <img src="{{ asset('/images/agents/' . $agent->image) }}" alt="">
                                                </div>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <hr>
                                <h6>Associated objects ({{ $agent->products->count() }}):</h6>
                                @if($agent->products)
                                    <ol>
                                        @foreach($agent->products as $key => $product)
                                            <a href="{{url('/back/products/'. $product->id . '/edit?category=' . $product->category_id)}}">
                                                <b><li>{{ $key + 1 }} | {{ $product->translation->name }} <small>[{{ $product->code }}]</small></li></b>
                                            </a>
                                        @endforeach
                                    </ol>
                                @endif
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
            $('#image_preview').html(
                "<div class='append-wrap'><div>" + "<img src='" + URL.createObjectURL(event.target.files[i]) + "'>" + "</div>"
            );
        }
    }
</script>
<style>
    ol li {
        padding: 10px 0;
    }
</style>
