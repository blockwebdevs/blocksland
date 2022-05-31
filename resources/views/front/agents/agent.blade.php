@extends('../front.app')
@section('content')
    @include('front.partials.header')

    <div class="container content">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="{{ url('/'.$lang->lang. '/agents/') }}">{{ trans('vars.general.ourAgents') }} » </a>
            <a href="#">{{ trans('vars.general.offersFrom') }} {{ $agent->name }}</a>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="heading-h1">
                    <h1>{{ trans('vars.general.offersFrom') }} {{ $agent->name }}</h1>
                </div>
                <div class="row products">
                    @foreach($products as $key => $product)
                        <div class="col-md-4 item">
                            <div class="item-inside">

                                <div class="address">
                                    <p>{{ $product->translation->name }} {{ $product->translation->subtitle }}</p>
                                </div>
                                <a href="{{ url('/'. $lang->lang .'/catalog/'.$product->category->translation->slug. '/'. $product->translation->slug) }}">
                                    @if($product->mainImage)
                                        <img src="{{ asset('/images/products/sm/' . $product->mainImage->src)  }}"
                                             alt="">
                                    @else
                                        <img src="{{ asset('/images/stub-1.jpg')  }}" alt="">
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
    </div>
    @include('front.partials.contacts')
    @include('front.partials.footer')
@stop
