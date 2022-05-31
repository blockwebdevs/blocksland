@extends('../front.app')
@section('content')
    @include('front.partials.header')

    <div class="container content">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="#">{{ trans('vars.general.blog') }}</a>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">{{ trans('vars.general.blog') }}</h1>

                @foreach($posts as $post)
                    <div class="articles">
                        <div class="article row article-list">
                            <div class="col-sm-4 img">
                                <a href="{{ url('/'.$lang->lang.'/blog/'.$post->translation->slug) }}">
                                    @if($post->image)
                                        <img src="{{ asset('/images/blogs/'. $post->image) }}"
                                             alt="{{ $post->translation->name }} photo"
                                             title="{{ $post->translation->name }} manoleestate" />
                                    @else
                                        <img src="{{ asset('/stub.jpg') }}"
                                             alt="manoleestate photo"
                                             title="manoleestate">
                                    @endif
                                </a>
                            </div>
                            <div class="col-sm-8 detail">
                                <h3>
                                    <a href="{{ url('/'.$lang->lang.'/blog/'.$post->translation->slug) }}">
                                        {{ $post->translation->name }}
                                    </a>
                                </h3>
                                <div class="descr">
                                    {{ Str::limit($post->translation->description, 390) }}
                                </div>
                                <div class="article-footer">
                                    <div class="author">
                                        <p>
                                            <i class="fas fa-clock"></i>{{ $post->date_time }}
                                        </p>
                                    </div>
                                    <div class="links">
                                        <a href="{{ url('/'.$lang->lang.'/blog/'.$post->translation->slug) }}">
                                            {{ trans('vars.general.viewMore') }} <i class="fas fa-angle-double-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
                <div class="pagination-wrapp">
                    {{ $posts->links('vendor.pagination.bootstrap-4') }}
                </div>
            </div>
            <div class="col-md-12">
                <div class="page-desrc page-html">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                    proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur
                    adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>
            </div>
        </div>
    </div>
    </div>

    @include('front.partials.contacts')
    @include('front.partials.footer')
@stop
