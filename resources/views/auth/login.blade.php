<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="_token" content="{{ csrf_token() }}">

    <title>Admin Panel</title>
    <meta name="description" content="Admin Panel">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('/logo.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('/logo.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('/logo.png') }}">

    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,600">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.1/jquery.rateyo.min.css">

    <link rel="stylesheet" href="/admin/css/normalize.min.css">
    <link rel="stylesheet" href="/admin/css/custom.css">
    <link rel="stylesheet" href="/admin/css/jquery-ui.css">
    <link rel="stylesheet" href="/admin/css/style.css">
    <link rel="stylesheet" href="/admin/css/vendor.css">
    <link rel="stylesheet" href="/admin/css/app-green.css">
    <link rel="stylesheet" href="/admin/css/datepicker.css">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
</head>

<body>
<div class="auth">
    <div class="auth-container">
        <div class="card">
            <header class="auth-header">
                <h1 class="auth-title">
                    Admin Panel
                </h1>
            </header>
            <div class="auth-content">

                <form class="login-form" role="form" method="POST" action="{{ url('/auth/login') }}" id="login-form">
                    <div class="form-group">
                        <label class="text-left"  for="username">Username</label>
                        <input type="text" class="form-control underlined" name="login" id="username"
                               placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <label class="text-left" for="password">Password</label>
                        <input type="password" class="form-control underlined" name="password" id="password"
                               placeholder="Password" required>
                    </div>
                    <input type="submit" class="btn btn-block btn-custom" onclick="saveForm(this)"
                           data-form-id="login-form" value="Sing In"/>

                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                </form>
            </div>
        </div>
        <div class="go-to-site">
            <a href="{{ url('/') }}">
                <i class="fa fa-arrow-left"></i> Go back
            </a>
        </div>
    </div>
</div>
<style>
    .form-group label {
        display: block;
        color: #2B1D1A;
    }
    .auth {
        background-color: #2B1D1A;
    }
    .auth-container .auth-header {
        border-bottom: 1px solid #2B1D1A;
    }
    .auth-container .auth-title {
        color: #2B1D1A;
        text-transform: uppercase;
    }
    .btn-custom {
        background-color: #2B1D1A;
        color: #FFF;
        text-transform: uppercase;
        margin-top: 30px;
        font-size: 14px;
        padding: 15px;
    }
    .btn-custom:hover {
        color: #EEE;
    }
    .go-to-site {
        width: 100%;
        /*background-color: #FFF;*/
        text-align: center;
        padding: 10px;
    }
    .go-to-site a {
        text-decoration: none;
        color: #FFF;
        text-transform: uppercase;
        font-size: 12px;
        font-weight: bold;
    }
    .go-to-site a:hover {
        color: #EEE;
    }
    .underlined {
        padding-left: 20px !important;
        font-size: 13px;
        color: #2B1D1A;
    }
</style>
</body>
</html>
