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

                <div class="col-md-12 agents">
                    @foreach($agents as $agent)
                        <div class="col-md-4">
                            <a href="{{ url('/'. $lang->lang . '/agents/'. $agent->id) }}">
                                <div class="agent-item">
                               <span class="image-wrapper">
                                   @if($agent->image)
                                       <img src="{{ asset('/images/agents/'.$agent->image) }}">
                                   @endif
                               </span>
                                    <h5>{{ $agent->name }}</h5>
                                    <p class="agent-contacts">
                                        <a href="tel:%2B{{ $agent->phone }}">
                                            <i class="fas fa-phone"></i> +(373)
                                            {{ $agent->phone }}
                                        </a>
                                    </p>
                                </div>
                            </a>
                        </div>
                    @endforeach
                </div>

                <div class="col-md-12 page-html">
                    {!! $page->translation->body !!}
                </div>
            </div>
        </div>
    </div>
    @include('front.partials.footer')
@stop
