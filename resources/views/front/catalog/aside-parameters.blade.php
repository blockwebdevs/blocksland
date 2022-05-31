
<div class="product-aside-inside">
    <ul class="parameter-list">
        <li><span>{{ trans('vars.parameters.totalArea') }}</span> <span>{{ $product->surface }} {!! $product->category->unit !!}</span></li>
        @foreach($parameters as $parameter)
            @php
                $value = $product->getParameterValue($parameter->id)->first() ? $product->getParameterValue($parameter->id)->first()->value : null;
            @endphp
            @if($value && $value->translation)
                <li>
                    <span>{{ $parameter->translation->name}}</span>
                    <span>
                        {{ $value->translation->name }}
                    </span>
                </li>
            @endif
        @endforeach
        <li><span>{{ trans('vars.parameters.code') }}</span> <span>{{ $product->code }}</span></li>
    </ul>
</div>
