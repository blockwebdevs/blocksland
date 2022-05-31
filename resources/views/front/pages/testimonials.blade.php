@extends('../front.app')
@section('content')
    @include('front.partials.header')
    <div class="container-fluid content section-min">
        <div class="breadcrumbs">
            <a href="{{ url('/'.$lang->lang) }}">{{ trans('vars.general.home') }} » </a>
            <a href="#">{{ $page->translation->title }}</a>
        </div>
        <div class="col-md-12 testimonial-page">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center">{{ $page->translation->title }}</h1>
                </div>
                <div class="col-md-12">
                    <div class="testimonials-section">
                        <ul>
                            @foreach($testimonialsAll as $testimonial)
                                <li>
                                    <div class="testimonial-item">
                                        <div class="testimonial">
                                            {{ $testimonial->body }}
                                        </div>
                                        <div class="testimonial-author">{{ $testimonial->author }}</div>
                                        <div class="clear"></div>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="contacts text-center">
                        <div class="contact-form text-center">
                            <h2>{{ trans('vars.notifications.leaveReview') }}</h2><br>
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

                <div class="col-md-12 page-html">
                    {!! $page->translation->body !!}
                </div>
            </div>
        </div>
    </div>
    @include('front.partials.footer')
@stop
