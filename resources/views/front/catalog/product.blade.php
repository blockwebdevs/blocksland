@extends('../front.app')
@section('content')
    @include('front.partials.header')

    <div class="container-fluid content section-min">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="{{ url('/'.$lang->lang.'/catalog/'.$product->category->translation->slug) }}">{{ $product->category->translation->name }}
                » </a>
            <a href="#">{{ $product->translation->name }}</a>
        </div>
        <div class="row">
            <div class="col-md-7">
                <h1>{{ $product->translation->name }} {{ $product->translation->subtitle }}</h1>
                <div class="product-image">
                    <section class="slider">
                        <div id="slider" class="flexslider">
                            <ul class="slides list-unstyled row" id="lightgallery">
                                @foreach($product->images as $key => $image)
                                    <li data-responsive="{{ asset('/images/products/og/'. $image->src) }} 375,{{ asset('/images/products/og/'. $image->src) }} 480, {{ asset('/images/products/og/'. $image->src) }} 800"
                                        data-src="{{ asset('/images/products/og/'. $image->src) }}"
                                        ata-sub-html="<h4>Image Description</p>"
                                        data-pinterest-text="Pin it1"
                                        data-tweet-text="share on twitter 1">
                                        <img src="{{ asset('/images/products/og/'.$image->src) }}"
                                             alt="{{ $product->translation->name .' '. $product->translation->subtitle }} ({{ $key + 1 }} / {{ $product->images->count() }})"
                                             title="{{ $product->translation->subtitle .' '. $product->translation->name }} {{ $key + 1 }} manoleestate"/>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <div id="carousel" class="flexslider">
                            <ul class="slides">
                                @foreach($product->images as $image)
                                    <li>
                                        <img src="{{ asset('/images/products/sm/'.$image->src) }}"
                                             alt="{{ $product->translation->name .' '. $product->translation->subtitle }} photo {{ $key + 1 }}"
                                             title="{{ $product->translation->subtitle .' '. $product->translation->name }} {{ $key + 1 }} manoleestate"/>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </section>
                </div>
                <div class="product-aside mobile">
                    @include('front.catalog.aside-parameters')
                    <h3 class="price">{{ number_format($product->price, 0, null, ' ') }} €<br></h3>
                    @include('front.catalog.aside-agent')
                </div>
                <div class="row product">
                    <div class="col-md-12 descr">
                        <h3>{{ trans('vars.parameters.description') }}</h3>
                        <div>
                            <p>{{ $product->translation->description }}</p>
                            {!! $product->translation->body !!}
                        </div>
                    </div>
                </div>
            </div>

            @if(!isMobile())
                <div class="col-md-5 product-aside desktop">
                    <h3 class="price">{{ number_format($product->price, 0, null, ' ') }} €<br></h3>
                    @include('front.catalog.aside-agent')
                    @include('front.catalog.aside-parameters')

                    @include('front.catalog.aside-map')
                </div>
            @endif

            <div class="product-aside mobile">
                @include('front.catalog.aside-map')
            </div>
        </div>
    </div>

    </div>

    @include('front.partials.footer')
@stop

@if($product->mainImage)
@section('meta')
    <meta property="og:image" content="{{ asset('/images/products/og/'.$product->mainImage->src) }}"/>
@stop
@endif
