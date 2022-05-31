<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-2 padding-off">
                <a href="" class="logo-footer desktop">
                    <img src="/logo.png">
                </a>

            </div>
            <div class="col-md-2">
                <h5>{{ trans('vars.header/footer.information') }}</h5>
                <ul>
                    @foreach($footerMenus as $footerMenu)
                        <li>
                            <a href="{{ url('/'.$lang->lang.'/'.$footerMenu->translation->slug) }}">
                                {{ $footerMenu->translation->title  }}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>


            <div class="col-md-2">
                <h5>{{ trans('vars.header/footer.offers') }}</h5>
                <ul>
                    @foreach($categories as $category)
                        <li>
                            <a href="{{ url('/'.$lang->lang.'/catalog/'.$category->translation->slug) }}">
                                {{ $category->translation->name }}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
            <div class="col-md-3">
                <h5>{{ trans('vars.header/footer.policies') }}</h5>
                <ul>
                    @foreach($policiesMenus as $policiesMenu)
                        <li>
                            <a href="{{ url('/'.$lang->lang.'/'.$policiesMenu->translation->slug) }}">
                                {{ $policiesMenu->translation->title  }}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
            <div class="col-md-3 text-center">
                <div class="socials row desktop">
                    <a href="{{ $globalYoutube }}" target="_blank"> <i class="fab fa-youtube"></i> </a>
                    <a href="{{ $globalFacebook }}" target="_blank"> <i class="fab fa-facebook"></i> </a>
                    <a href="{{ $globalInstagram }}" target="_blank"> <i class="fab fa-instagram"></i> </a>
                    </a>
                </div>

                <div class="footer-contacts">
                    <p>
                        <a href="tel:%2B{{ $globalPhone }}" class="phone-effect">
                            <i class="fas fa-phone"></i>
                            {{ $globalPhone }}
                        </a>
                    </p>
                    <a href="mailto:{{ $globalEmail }}"><i class="fas fa-envelope"></i> blockslandonline@gmail.com</a>
                </div>

            </div>
            <div class="col-md-12 text-center copyright-section">

            </div>
        </div>
    </div>
</div>


