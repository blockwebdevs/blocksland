@extends('front.app')
@section('content')
    @include('front.partials.header')

    <main class="notFoundContent container content text-center">
        <div class="container">
            <div class="row">
                <div class="title">
                    503
                </div>
                <div>
                    <p>Ups. ceva nu a mers bine.</p>
                    <p>Incercati inca o data sau alegeti o optiune din meniul de sus.</p>
                </div>
            </div>
        </div>
    </main>

    @include('front.partials.footer')
@stop
