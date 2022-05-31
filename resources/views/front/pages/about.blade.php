@extends('../front.app')
@section('content')
    @include('front.partials.header')

    <div class="container-fluid section-min content about-section">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="#">{{ $page->translation->title }}</a>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="heading">
                    <h1 class="text-center">{{ $page->translation->title }}</h1>
                </div>
                <div class="about">
                    <div class="about-container">
                        <div class="inside page-html">
                            {!! $page->translation->body !!}
                        </div>
                    </div>
                </div>
            </div>
            @include('front.partials.about')
        </div>
    </div>

{{--    @include('front.partials.contacts')--}}

    @include('front.partials.footer')

@stop
