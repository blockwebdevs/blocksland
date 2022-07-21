@extends('../front.app')
@section('content')
    @include('front.partials.header')

    <div class="container-fluid content section-min">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="#">{{ $category->translation->name }}</a>
        </div>
        <div class="row">
            @if(!isMobile())
                <div class="col-md-12"><br><br>
                    <div class="heading-h1">
                        <h1>{{ $category->translation->name }}</h1>
                    </div>
                    @if(!isMobile())
                        @include('front.catalog.aside-sort')
                    @endif
                    <br><br>
                </div>
            @endif
            <div class="col-md-4 sidebar">
                @if(!isMobile())

                    @include('front.catalog.aside-filter')
                @endif
            </div>
            <div class="col-md-8">
                @if(isMobile())
                    <div class="heading-h1">
                        <h1>{{ $category->translation->name }}</h1>
                    </div>
                @endif


                <div class="row products">
                    @foreach($products as $key => $product)
                        <div class="col-md-6 item">
                            <div class="item-inside">

                                <div class="address">
                                    <p>{{ $product->translation->name }} {{ $product->translation->subtitle }}</p>
                                </div>
                                <a href="{{ url('/'. $lang->lang .'/catalog/'.$product->category->translation->slug. '/'. $product->translation->slug) }}">
                                    @if($product->mainImage)
                                        <img src="{{ asset('/images/products/sm/' . $product->mainImage->src)  }}"
                                             alt="{{ $product->translation->name .' '. $product->translation->subtitle }} photo"
                                             title="{{ $product->translation->subtitle .' '. $product->translation->name }} blocksland">
                                    @else
                                        <img src="{{ asset('/images/stub.png')  }}"
                                             alt="blocksland photo"
                                             title="blocksland">
                                    @endif
                                </a>
                                <div class="prod-params">
                                    @if($product->surface)
                                        <div class="param area">
                                            <span>{{ trans('vars.parameters.area') }}</span>
                                            <p>{{ $product->surface }} {!! $product->category->unit !!}</p>
                                        </div>
                                    @endif
                                    @php $rooms = getProductRooms($product); @endphp
                                    @if($rooms)
                                        <div class="param rooms">
                                            <span>{{ trans('vars.parameters.rooms') }}</span>
                                            <p>{{ $rooms }}</p>
                                        </div>
                                    @endif
                                    <div class="param price">
                                        {{ number_format($product->price, 0, null, ' ') }} €
                                    </div>
                                </div>
                                <div class="author-prod row">
                                    <div class="col-xs-8">
                                        @if($product->agent)
                                            <p>
                                                <a href="{{ url('/'.$lang->lang.'/agents/'.$product->agent->id) }}">{{ $product->agent->name }}</a>
                                            </p>
                                        @endif
                                    </div>
                                    <div class="col-xs-4 text-right">
                                        <span>#{{ $product->code }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div>
                <div class="pagination-wrapp">
                    {{ $products->links('vendor.pagination.bootstrap-4') }}
                </div>
            </div>


        </div>


        @if(isMobile())
            <input type="checkbox" id="checkbox_filter" class="wrapper__checkbox__filter">
            <label for="checkbox_filter" class="wrapper__button__filter filter-icon">
                <section class="filter-icon-wrapp">
                    {{--                   <span>{{ trans('vars.parameters.filter') }}</span>--}}
                    <div><i class="fas fa-filter"></i></div>
                    <div class="close-icon"><i class="fas fa-times"></i></div>
                </section>
            </label>

            <div class="wrapper__filter">
                <div>
                    <div class="sidebar">
                        @include('front.catalog.aside-filter')
                    </div>
                </div>
            </div>

        @endif

    </div>

    {{--    @include('front.partials.contacts')--}}

    @include('front.partials.footer')
@stop

@section('meta')
    <meta property="og:image" content="{{ asset('/images/categories/og/' . $category->icon) }}"/>
@stop
