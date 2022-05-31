<!DOCTYPE html>
<html lang="{{ $lang->lang }}">
<head>
    <meta name="robots" content="nofollow,noindex"/>
    <meta name="googlebot" content="noindex, nofollow"/>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('logo.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('logo.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('logo.png') }}">

    <title>{{ $seoData['title'] }}</title>
    <meta name="description" content="{{ $seoData['description'] }}">
    <meta name="keywords" content="{{ $seoData['keywords'] }}">

    <meta property="og:type" content="website"/>
    <meta property="og:title" content="{{ $seoData['title'] }}"/>
    <meta property="og:description" content="{{ $seoData['description'] }}"/>
    <meta property="og:url" content="{{ url()->current() }}"/>
    <meta property="og:site_name" content="blockslandonline"/>

    @yield('meta', \View::make('front.partials.defaultMeta'))

    <link rel="canonical" href="{{ url()->current() }}"/>

    @foreach($languagesUrls as $langName => $languagesUrl)
        <link title="{{ trans('variables.'.$langName) }}" dir="ltr" type="text/html" rel="alternate"
              hreflang="{{ $langName }}" href="{{ url($languagesUrl) }}"/>
    @endforeach
    <link title="{{ trans('variables.ro') }}" dir="ltr" type="text/html" rel="alternate" hreflang="x-default"
          href="{{ url()->current() }}"/>

    <link href="{{ asset('front/css/normalize.css')  }}" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link href="{{ asset('front/css/fonts.css')  }}" rel="stylesheet">
    <link href="{{ asset('front/css/images.css')  }}" rel="stylesheet">
    <link href="{{ asset('front/css/slick.css')  }}" rel="stylesheet">
    <link href="{{ asset('front/css/slick-theme.css')  }}" rel="stylesheet">
    <link href="{{ asset('front/package/css/lightgallery-bundle.css') }}" rel="stylesheet"/>
    <link href="{{ asset('front/flexslider/css/flexslider.css') }}" rel="stylesheet">
    <link href="{{ asset('front/css/style.css')  }}" rel="stylesheet">
    <link href="{{ asset('front/css/responsive.css')  }}" rel="stylesheet">
    <link href="{{ asset('front/css/sort-menu.css')  }}" rel="stylesheet">
    <link href="{{ asset('front/fontawesome/css/all.css')  }}" rel="stylesheet"> <!--load all styles -->

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="wrapper">

    @yield('content')

    @include('front.partials.modals')

</div>

<script src="{{ asset('front/package/lightgallery.umd.js') }}"></script>
<script src="{{ asset('front/js/jquery-3.6.0.min.js') }}"></script>
<script src="{{ asset('front/flexslider/js/jquery.flexslider-min.js') }}"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<script src="{{ asset('front/js/slick.js') }}"></script>
<script src="{{ asset('front/js/scripts.js') }}"></script>

</body>
</html>
