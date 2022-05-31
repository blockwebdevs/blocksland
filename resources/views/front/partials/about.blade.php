
<div class="col-md-12">
    <div class="heading">
        <h3>{{ trans('vars.general.reviews') }}</h3>
    </div>
    <div class="testimonials-section">
        @foreach($testimonials as $testimonial)
            <div class="testimonial-item">
                <div class="testimonial">
                    {{ $testimonial->body }}
                </div>
                <div class="testimonial-author">{{ $testimonial->author }}</div>
                <div class="clear"></div>
            </div>
        @endforeach

        <div class="view-more-testimonials">
            @if($testimonialsPage)
                <a href="{{ '/'. $lang->lang.'/'.$testimonialsPage->translation->slug }}">{{ trans('vars.general.viewMore') }} <i class="fas fa-angle-double-right"></i></a>
            @endif
        </div>
    </div>
</div>
