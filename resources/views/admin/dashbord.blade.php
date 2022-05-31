@extends(' admin.app')
@include(' admin.nav-bar')
@include(' admin.left-menu')
@section('content')
    @include(' admin.alerts')

    <article class="dashboard-page">
        <section class="section">
            <div class="row sameheight-container">
                @if(!is_null($menu))
                    @foreach($menu as $item)
                        @if ($item->on_dashboard)

                            <div class="col col-xs-12 col-sm-12 col-md-6 col-xl-6 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs">
                                    <div class="card-block">
                                        <div class="title-block">
                                            <h4 class="title">
                                                <a href="{{ url('/back/' . $item->src) }}">
                                                    {{ $item->name }}
                                                </a>
                                            </h4>
                                        </div>
                                        <div class="row row-sm stats-container">
                                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"><i class="fa {{ $item->icon }}"></i></div>
                                                <div class="stat">
                                                    <div class="value"> {{ moduleItems($item->table_name) }} </div>
                                                    <div class="name"> items</div>
                                                </div>
                                                <progress class="progress stat-progress" value="90" max="100">
                                                    <div class="progress">
                                                        <span class="progress-bar" style="width: 15%;"></span>
                                                    </div>
                                                </progress>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endif

                    @endforeach
                @endif
            </div>
        </section>
    </article>

@stop
@section('footer')
    <footer>
        @include(' admin.footer')
    </footer>
@stop
