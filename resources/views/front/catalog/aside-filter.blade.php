<div>
    <h2 class="filter-heading">{{ trans('vars.parameters.filter') }}</h2>
    @if(isMobile())
        @include('front.catalog.aside-sort')
    @endif


    <form method="GET">
        @if(Request::get('sort'))
            <input type="hidden" name="sort" value="{{ Request::get('sort') }}">
        @endif
        @if(Request::get('limit'))
            <input type="hidden" name="limit" value="{{ Request::get('limit') }}">
        @endif

        <div class="filter-area">
            <div class="ranges-filter">

                <h3>{{ trans('vars.parameters.price') }} (€)</h3>
                <div class="range-inputs">
                    <input type="number" placeholder="{{ trans('vars.parameters.from') }}" name="price[min]"
                           value="{{ Request::get('price') ? Request::get('price')['min'] : ''}}">
                    <span>-</span>
                    <input type="number" placeholder="{{ trans('vars.parameters.to') }}" name="price[max]"
                           value="{{ Request::get('price') ? Request::get('price')['max'] : '' }}">
                </div>
                <h3>{{ trans('vars.parameters.totalArea') }}
                    @if($category->unit && strlen($category->unit) > 0)
                        ({!! $category->unit !!})
                    @endif
                </h3>

                <div class="range-inputs">
                    <input type="number" placeholder="{{ trans('vars.parameters.from') }}" name="surface[min]"
                           value="{{ Request::get('surface') ? Request::get('surface')['min'] : ''}}">
                    <span>-</span>
                    <input type="number" placeholder="{{ trans('vars.parameters.to') }}" name="surface[max]"
                           value="{{Request::get('surface') ? Request::get('surface')['max'] : '' }}">
                </div>
            </div>

            @foreach($parameters as $parameter)
                @if($parameter->type === 'checkbox')
                    <div class="filter-checks">
                        <h3 data-toggle="collapse" data-target="#{{ $parameter->key }}" class="
                        {{ $parameter->key === 'suburbs' ? '__collapsed' : ''}}  collapsed">
                            {{ $parameter->translation->name }}
                            {!! $parameter->key === 'suburbs' ? '<i class="fas fa-sort-up"></i>' : '' !!}
                        </h3>
                        <div class="{{ $parameter->key === 'suburbs' ? 'collapse' : '' }}"
                             id="{{ $parameter->key === 'suburbs' ? $parameter->key : ''}}">
                            @foreach($parameter->parameterValues as $parameterValue)
                                <label class="{{ $parameter->key }}">
                                    <input type="checkbox"
                                           {{ in_array($parameter->id.$parameterValue->id, $selectedParams) ? 'checked' : ''}}
                                           name="parameters[{{ $parameter->id }}][]"
                                           value="{{ $parameterValue->id }}">
                                    <span>
                                            @if($parameterValue->translation) {{ $parameterValue->translation->name }} @endif
                                        </span>
                                </label>
                            @endforeach
                        </div>
                    </div>
                @endif
            @endforeach
            <div class="clear"></div>
            <input type="submit" value="{{ trans('vars.parameters.search') }}">
        </div>
    </form>
</div>
