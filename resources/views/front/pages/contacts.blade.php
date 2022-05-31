@extends('../front.app')
@section('content')
    @include('front.partials.header')
    <div class="container-fluid content section-min">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="#">{{ $page->translation->title }}</a>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">{{ $page->translation->title }}</h1>
            </div>
            <div class="col-md-6">
                <div class="contacts-details">
                    <div>
                        <a href="">
                            <img src="/logo.png">
                        </a>
                    </div>
                    <div class="links">
                        <a href="tel:%2B{{ $globalPhone }}"><i class="fas fa-phone"></i> {{ $globalPhone }}</a>
                    </div>
                    <div class="links">
                        <a href="mailto:{{ $globalEmail }}"><i class="fas fa-envelope"></i> blockslandonline@gmail.com</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="contacts">
                    <div class="contact-form">
                        <h2>{{ trans('vars.contacts.wouldLikeToHearYou') }}</h2>
                        <p>{{ trans('vars.contacts.sendUsMessage') }}</p>
                        <form method="POST" action="{{ url('/' . $lang->lang . '/feed-back') }}" class="_submit-form">
                            {{ csrf_field() }}
                            <div class="col-md-12">
                                <input type="text" placeholder="{{ trans('vars.header/footer.name') }}*" name="name" required>
                            </div>
                            <div class="col-md-6">
                                <input type="email" placeholder="{{ trans('vars.header/footer.email') }}*" name="email" required>
                            </div>
                            <div class="col-md-6">
                                <input type="number" placeholder="{{ trans('vars.header/footer.phone') }}*" name="phone" required>
                            </div>
                            <div class="col-md-12">
                                <textarea placeholder="{{ trans('vars.contacts.message') }}*" name="message" required></textarea>
                            </div>
                            <div class="col-md-12">
                                <input type="submit" class="_submit-btn" value="{{ trans('vars.contacts.send') }}">
                               <div class="_loader">
                                   <div class="loader ">Loading...</div>
                               </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><br><br>
    @include('front.partials.footer')
@stop
