@extends('../front.app')
@section('content')
    @include('front.partials.header')
    <div class="container-fluid content section-min">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="#">{{ $page->translation->title }}</a>
        </div>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center">{{ $page->translation->title }}</h1>
                </div>
                <div class="col-md-12 page-html">
                    {!! $page->translation->body !!}
                </div>
            </div>
        </div>
    </div>
    @include('front.partials.footer')
@stop
