@extends('admin.app')
@include('admin.nav-bar')
@include('admin.left-menu')
@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control panel</a></li>
            <li class="breadcrumb-item"><a href="{{ route('users.index') }}">Users</a></li>
            <li class="breadcrumb-item active" aria-current="page">Edit User</li>
        </ol>
    </nav>

    <div class="title-block">
        <h3 class="title">Edit User </h3>
        @include(' admin.list-elements', ['actions' => ['Add new' => route('users.create')]])
    </div>

    <div class="list-content">
        @include(' admin.alerts')

        <form class="form-reg" role="form" method="POST" action="{{ route('users.update', $user->id) }}">
            {{ csrf_field() }}
            {{ method_field('PATCH') }}
            <div class="part full-part">
                <ul>
                    <li>
                        <label for="username">Login</label>
                        <input type="text" name="username" class="username" id="username" value="{{$user->login}}" required>
                    </li>
                    <li>
                        <label for="email">Email</label>
                        <input type="email" name="email" class="name" id="email" value="{{$user->email}}" required>
                    </li>
                    <li>
                        <label for="password">Password</label>
                        <input type="password" name="password" class="name" id="password" required>
                    </li>
                    <li>
                        <label for="password-again">Password Again</label>
                        <input type="password" name="password-again" class="name" id="password-again" required>
                    </li>
                    <li>
                        <input type="submit" value="Save">
                    </li>
                </ul>
            </div>
        </form>
    </div>
@stop
