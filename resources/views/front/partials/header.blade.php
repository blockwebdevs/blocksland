@if(!isMobile())
    <div class="header fixed-header fixed desktop">
        <div class="container">
            <div class="row">
                <div class="col-md-1 logo">
                    <a href="{{ url('/'.$lang->lang) }}">
                        <img src="/logo.png">
                    </a>
                </div>
                <div class="col-md-11 menus">
                    <div class="row top-menu">
                        <div class="col-md-8 socials">
                            <a href="{{ $globalFacebook }}" target="_blank"><i class="fab fa-facebook"></i></a>
                            <a href="{{ $globalInstagram }}" target="_blank"><i class="fab fa-instagram"></i></a>
                            <a href="{{ $globalYoutube }}" target="_blank"><i class="fab fa-youtube"></i></a>
                            <a class="search-section">
                                <i class="fas fa-search open-search"></i>
                                <span class="search-section-inside">
                                    <form action="{{ url('/'.$lang->lang.'/search') }}" method="GET">
                                        <input type="text" name="search" id="search-input"
                                               value="{{ Request::get('search') }}">
                                        <button type="submit" class="submit-search">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </form>
                                </span>
                            </a>
                        </div>
                        <div class="col-md-4 langs text-right">
                        <span>
                            @foreach(array_reverse($languagesUrls) as $langName => $languagesUrl)
                                <a href="{{ url($languagesUrl) }}"
                                   class="{{ $lang->lang === $langName ? 'active' : ''}}">
                                    {{ $langName }}
                                </a>
                            @endforeach
                        </span>
                        </div>
                    </div>
                    <div class="menu">
                        <ul>
                            <li class="{{ !Request::segment(2) ? 'active' : '' }}">
                                <a href="{{ url('/'.$lang->lang) }}">
                                    Home
                                </a>
                            </li>
                            @foreach($categories as $category)
                                <li class="{{ Request::segment(3) === $category->translation->slug ? 'active' : '' }}">
                                    <a href="{{ url('/'.$lang->lang.'/catalog/'.$category->translation->slug) }}">
                                        {{ $category->translation->name }}
                                    </a>
                                </li>
                            @endforeach

                            @foreach($headerMenus as $headerMenu)
                                <li class="{{ Request::segment(2) === $headerMenu->translation->slug ? 'active' : '' }}">
                                    <a href="{{ url('/'.$lang->lang.'/'.$headerMenu->translation->slug) }}">
                                        {{ $headerMenu->translation->title  }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@else
    <div class="header fixed-header fixed mobile">
        <div class="container menus">
            <div class="row top-menu">
                <div class="col-xs-4 logo">
                    <a href="{{ url('/'.$lang->lang) }}">
                        <img src="/logo.png">
                    </a>
                </div>
                <div class="col-xs-8 menu-section">
                    <div class="phone">
                    </div>
                    <div class="menu-burgher">
                        <a class="search-section">
                            <i class="fas fa-search open-search"></i>
                            <span class="search-section-inside">
                                                    <form action="{{ url('/'.$lang->lang.'/search') }}" method="GET">
                                                        <input type="text" name="search" id="search-input"
                                                               value="{{ Request::get('search') }}">
                                                        <button type="submit" class="submit-search">
                                                            <i class="fas fa-search"></i>
                                                        </button>
                                                    </form>
                                                </span>
                        </a>
                        <input type="checkbox" id="checkbox" class="wrapper__checkbox">
                        <label for="checkbox" class="wrapper__button">
                            <span class="wrapper__button-line"></span>
                            <span class="wrapper__button-line"></span>
                            <span class="wrapper__button-line"></span>
                        </label>
                        <div class="wrapper__menu">
                            <div class="wrapper__menu__inside">
                                <ul>
                                    @foreach($categories as $category)
                                        <li class="{{ Request::segment(3) === $category->translation->slug ? 'active' : '' }}">
                                            <a class="wrapper__menu-link"
                                               href="{{ url('/'.$lang->lang.'/catalog/'.$category->translation->slug) }}">
                                                {{ $category->translation->name }}
                                            </a>
                                        </li>
                                    @endforeach

                                    <li>
                                        <a class="wrapper__menu-link"
                                           href="{{ url('/'.$lang->lang.'/blog') }}">
                                            Blog
                                        </a>
                                    </li>

                                    @foreach($headerMenus as $headerMenu)
                                        <li class="{{ Request::segment(2) === $headerMenu->translation->slug ? 'active' : '' }}">
                                            <a class="wrapper__menu-link"
                                               href="{{ url('/'.$lang->lang.'/'.$headerMenu->translation->slug) }}">
                                                {{ $headerMenu->translation->title  }}
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                                <div class="bottom-menu">
                                    <div class="socials">
                                        <a href="{{ $globalFacebook }}" target="_blank"><i class="fab fa-facebook"></i></a>
                                        <a href="{{ $globalYoutube }}" target="_blank"><i
                                                class="fab fa-youtube"></i></a>
                                        <a href="{{ $globalInstagram }}" target="_blank"><i
                                                class="fab fa-instagram"></i></a>
                                    </div>
                                    <div class="langs">
                                        @foreach(array_reverse($languagesUrls) as $langName => $languagesUrl)
                                            <a href="{{ url($languagesUrl) }}"
                                               class="{{ $lang->lang === $langName ? 'active' : ''}}">
                                                {{ $langName }}
                                            </a>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
