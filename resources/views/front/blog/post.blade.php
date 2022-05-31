@extends('../front.app')
@section('content')
    @include('front.partials.header')

    <div class="container content">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="{{ url('/'.$lang->lang. '/blog') }}">{{ trans('vars.general.blog') }} »</a>
            <a href="#">{{ $post->translation->name }}</a>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h1>{{ $post->translation->name }}</h1>
            </div>
            <div class="col-md-8">
                <div class="article single">
                    <div class="article-heading">
                        <div class="author">
                            <p><i class="fas fa-clock"></i>{{ $post->date_time }}</p>
                        </div>
                    </div>
                    <div class="body page-html">
                        @if($post->image)
                            <img src="{{ asset('/images/blogs/'.$post->image) }}" width="100%"
                                 alt="{{ $post->translation->name }} photo"
                                 title="{{ $post->translation->name }} manoleestate">
                        @endif
                        {!! $post->translation->body !!}
                    </div>
                </div>

            </div>
            <div class="col-md-4 similar-posts">
                <h3>{{ trans('vars.general.similarArticles') }}</h3>
                <div>
                    @foreach($similarPosts as $similarPost)
                        <a href="{{ url('/'.$lang->lang.'/blog/'.$similarPost->translation->slug) }}">
                            @if($similarPost->image)
                                <img src="{{ asset('/images/blogs/'.$similarPost->image) }}" width="100%"
                                     alt="{{ $post->translation->name }} photo"
                                     title="{{ $post->translation->name }} manoleestate">
                            @endif
                            <h5>{{ $similarPost->translation->name }}</h5>
                        </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    @include('front.partials.contacts')
    @include('front.partials.footer')
@stop

@if($post->image)
@section('meta')
    <meta property="og:image" content="{{ asset('/images/blogs/'.$post->image) }}"/>
@stop
@endif
