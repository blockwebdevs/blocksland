<div class="row cont-heading">
    @if($sorting)
        <div class="col-md-12 text-right cont-heading-inside">
            <span class="sort-title"> {{ trans('vars.parameters.sort') }}</span>
            <span class="select dropdown w-150">
                            {{ $sorting['sort'][0][1] }}
                            <ul class="dropdown_menu dropdown_menu--animated dropdown_menu-6">
                                 @foreach($sorting['sort'] as $key => $sort)
                                    @if(!$loop->first)
                                        <li class="dropdown_item-1">
                                            <a href="{{ request()->fullUrlWithQuery(['sort' => $sort[0]]) }}">{{ $sort[1] }}</a>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </span>
            <span class="select dropdown">
                            {{ $sorting['limit'][0][1] }}
                            <ul class="dropdown_menu dropdown_menu--animated dropdown_menu-6">
                                @foreach($sorting['limit'] as $key => $limit)
                                    @if(!$loop->first)
                                        <li class="dropdown_item-1">
                                            <a href="{{ request()->fullUrlWithQuery(['limit' => $limit[0]]) }}">{{ $limit[1] }}</a>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </span>
        </div>
    @endif
</div>
