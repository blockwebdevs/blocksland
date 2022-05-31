@extends('../front.app')
@section('content')
    @include('front.partials.header')

    <div class="content">
        <div class="teasers">
            <div class="container-fluid">
                <div class="row">
                    <div class="teasers-list caption-style-1">
                        @foreach($categories as $category)
                            <div class="car-item">
                                <div class="item image--cover"
                                     style="background-image: url('{{ asset('/images/categories/og/' . $category->icon) }}')">
                                    <p class="img-label">{{ $category->translation->name }}</p>
                                    <div class="caption">
                                        <div class="blur"></div>
                                        <div class="caption-text">
                                            @if($category->link_sale && strlen($category->link_sale) > 0)
                                                <a href="{{ url('/'.$lang->lang.'/catalog/'.$category->translation->slug.'?'.$category->link_sale) }}"
                                                   class="btn-option">{{ trans('vars.general.sale') }}</a>
                                            @endif
                                            @if($category->link_sale && strlen($category->link_rent) > 0)
                                                <a href="{{ url('/'.$lang->lang.'/catalog/'.$category->translation->slug.'?'.$category->link_rent) }}"
                                                   class="btn-option">{{ trans('vars.general.rent') }}</a>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

       <div class="section-min">
           <div class="prods-area">
               <div class="prods-area-inside">
                   <div class="heading">
                       <h3>RECOMMENDED</h3>
                   </div>
                   @foreach($recommendedProducts as $product)
                       <div class="item">
                           <div class="details">
                               <a href="{{ url('/'. $lang->lang .'/catalog/'.$product->category->translation->slug. '/'. $product->translation->slug) }}">
                                   <div class="img-block">
                                       <div class="hover-img"></div>
                                       @if($product->mainImage)
                                           <img src="{{ asset('/images/products/sm/' . $product->mainImage->src)  }}"
                                                alt="{{ $product->translation->name .' '. $product->translation->subtitle }} photo"
                                                title="{{ $product->translation->subtitle .' '. $product->translation->name }} manoleestate">
                                       @else
                                           <img src="{{ asset('/images/stub.png')  }}"
                                                alt="manoleestate photo"
                                                title="manoleestate">
                                       @endif
                                       <div class="prod-params">
                                           {{--                                        @if($product->surface)--}}
                                           {{--                                            <div class="param area">--}}
                                           {{--                                                <span>{{ trans('vars.parameters.area') }}</span>--}}
                                           {{--                                                <p>{{ $product->surface }} {!! $product->category->unit !!}</p>--}}
                                           {{--                                            </div>--}}
                                           {{--                                        @endif--}}
                                           {{--                                        @php $rooms = getProductRooms($product); @endphp--}}
                                           {{--                                        @if($rooms)--}}
                                           {{--                                            <div class="param rooms">--}}
                                           {{--                                                <span>{{ trans('vars.parameters.rooms') }}</span>--}}
                                           {{--                                                <p>{{ $rooms }}</p>--}}
                                           {{--                                            </div>--}}
                                           {{--                                        @endif--}}
                                           <div class="param title">
                                               {!! Str::limit($product->translation->name .' <br> '. $product->translation->subtitle, 40) !!}
                                           </div>
                                           <div class="param price">
                                               <p>{{ number_format($product->price, 0, null, ' ') }} €</p>
                                           </div>
                                       </div>
                                   </div>
                               </a>
                               {{--                            <p class="prod-footer">--}}
                               {{--                                {{ Str::limit($product->translation->name .' '. $product->translation->subtitle, 40) }}--}}
                               {{--                            </p>--}}
                           </div>
                       </div>
                   @endforeach
               </div>
           </div>

           <div class="prods-area">
               <div class="prods-area-inside">
                   <div class="heading">
                       <h3>Popular</h3>
                   </div>
                   @php
                       $recommendedProducts = $recommendedProducts->shuffle();
                   @endphp
                   @foreach($recommendedProducts as $product)
                       <div class="item">
                           <div class="details">
                               <a href="{{ url('/'. $lang->lang .'/catalog/'.$product->category->translation->slug. '/'. $product->translation->slug) }}">
                                   <div class="img-block">
                                       <div class="hover-img"></div>
                                       @if($product->mainImage)
                                           <img src="{{ asset('/images/products/sm/' . $product->mainImage->src)  }}"
                                                alt="{{ $product->translation->name .' '. $product->translation->subtitle }} photo"
                                                title="{{ $product->translation->subtitle .' '. $product->translation->name }} manoleestate">
                                       @else
                                           <img src="{{ asset('/images/stub.png')  }}"
                                                alt="manoleestate photo"
                                                title="manoleestate">
                                       @endif
                                       <div class="prod-params">
                                           {{--                                        @if($product->surface)--}}
                                           {{--                                            <div class="param area">--}}
                                           {{--                                                <span>{{ trans('vars.parameters.area') }}</span>--}}
                                           {{--                                                <p>{{ $product->surface }} {!! $product->category->unit !!}</p>--}}
                                           {{--                                            </div>--}}
                                           {{--                                        @endif--}}
                                           {{--                                        @php $rooms = getProductRooms($product); @endphp--}}
                                           {{--                                        @if($rooms)--}}
                                           {{--                                            <div class="param rooms">--}}
                                           {{--                                                <span>{{ trans('vars.parameters.rooms') }}</span>--}}
                                           {{--                                                <p>{{ $rooms }}</p>--}}
                                           {{--                                            </div>--}}
                                           {{--                                        @endif--}}
                                           <div class="param title">
                                               {!! Str::limit($product->translation->name .' <br> '. $product->translation->subtitle, 40) !!}
                                           </div>
                                           <div class="param price">
                                               <p>{{ number_format($product->price, 0, null, ' ') }} €</p>
                                           </div>
                                       </div>
                                   </div>
                               </a>
                               {{--                            <p class="prod-footer">--}}
                               {{--                                {{ Str::limit($product->translation->name .' '. $product->translation->subtitle, 40) }}--}}
                               {{--                            </p>--}}
                           </div>
                       </div>
                   @endforeach
               </div>
           </div>
       </div>

        <div class="container-fluid about-section-wrapper">

        </div>
    </div>

    @include('front.partials.footer')
@stop
