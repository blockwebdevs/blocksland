@if($product->iframe)
    <div class="product-location">
        <div class="map">
            {!! $product->iframe !!}
        </div>
    </div>
@endif
