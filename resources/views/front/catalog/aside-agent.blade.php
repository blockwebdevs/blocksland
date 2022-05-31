@if($product->agent)
    <div class="agent">
        <div class="agent-info text-center">
            <section>
                <a href="tel:%2B{{ $product->agent->phone }}" class="phone-effect">
                    <i class="fa fa-phone"></i>
                    {{ $product->agent->phone }}
                </a>
                <p>
                    <a href="#">{{ $product->agent->name }}</a>
                </p>
            </section>
        </div>
        <div class="caption-text caption-text-agent text-center">
            <a href="#" data-toggle="modal" data-target="#orderCall" class="btn-option">
                <i class="fas fa-phone-volume"></i>
                {{ trans('vars.header/footer.orderCall') }}
            </a>
        </div>
    </div>
@else
    <div class="agent">
        <div class="agent-info text-center">
            <section>
                <a href="tel:%2B{{ $globalPhone }}" class="phone-effect">
                    <i class="fas fa-phone-volume"></i>
                    +(373) 79 995 455
                </a>
            </section>
        </div>
        <div class="caption-text caption-text-agent text-center">
            <a href="#" data-toggle="modal" data-target="#orderCall" class="btn-option">
                <i class="fas fa-phone-volume"></i>
                {{ trans('vars.header/footer.orderCall') }}
            </a>
        </div>
{{--        <div class="agent-socials">--}}
{{--            <p>{{ trans('vars.parameters.contactUsUsing') }}:</p>--}}
{{--            <a href="viber://chat?number=%2B{{ $globalPhone }}" class="share__icon--viber"><i--}}
{{--                    class="fab fa-viber"></i></a>--}}
{{--            <a href="https://wa.me/%2B{{ $globalPhone }}" class="share__icon--whatsapp" target="_blank"><i--}}
{{--                    class="fab fa-whatsapp"></i></a>--}}
{{--            <a href="https://telegram.me/{{ $globalTelegram }}" class="share__icon--telegram" target="_blank"><i--}}
{{--                    class="fab fa-telegram"></i></a>--}}
{{--            <a href="{{ $globalInstagram }}" target="_blank" class="share__icon--instagram"><i--}}
{{--                    class="fab fa-instagram"></i></a>--}}
{{--            <a href="https://m.me/manoleestate.md" target="_blank" class="share__icon--facebook"><i--}}
{{--                    class="fab fa-facebook-messenger"></i></a>--}}
{{--        </div>--}}
    </div>
@endif
