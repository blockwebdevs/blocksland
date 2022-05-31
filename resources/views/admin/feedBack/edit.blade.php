@extends(' admin.app')
@include(' admin.nav-bar')
@include(' admin.left-menu')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item"><a href="{{ route('feedback.index') }}">Lead Management</a></li>
            <li class="breadcrumb-item active" aria-current="page">Lead</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Lead</h3>
    </div>
    @include(' admin.alerts')

    <div class="list-content">
        <form class="form-reg" role="form" method="POST" action="{{ route('pages.update', $feedBack->id) }}"
              id="add-form" enctype="multipart/form-data">
            {{ csrf_field() }}
            {{ method_field('PATCH') }}

            <div class="tab-content  active-content">
                <div class="part full-part">

                    <div class="col-md-6">
                        <ul>
                            <li>
                                <label for="first_name">Name</label>
                                <input type="text" name="first_name" class="name" id="first_name"
                                       value="{{ $feedBack->first_name }}">
                            </li>
                            <li>
                                <label for="email">Email</label>
                                <input type="text" name="email" class="name" id="email" value="{{ $feedBack->email }}">
                            </li>
                            <li>
                                <label for="phone">Phone</label>
                                <input type="text" name="phone" class="name" id="phone" value="{{ $feedBack->phone }}">
                            </li>
                            <li>
                                <label for="subject">Subject</label>
                                <input type="text" name="subject" class="name" id="subject"
                                       value="{{ $feedBack->subject }}">
                            </li>
                            <li><br>
                                <label for="phone">Change status</label>
                                <a href="{{ url('back/feedback/clooseStatus/'.$feedBack->id.'/new') }}"
                                   class="btn btn-success btn-sm rounded-s">New</a>
                                <a href="{{ url('back/feedback/clooseStatus/'.$feedBack->id.'/procesed') }}"
                                   class="btn btn-success btn-sm rounded-s">Procesed</a>
                                <a href="{{ url('back/feedback/clooseStatus/'.$feedBack->id.'/cloose') }}"
                                   class="btn btn-success btn-sm rounded-s">Close</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6">

                        <ul>
                            @if($feedBack->additional_1)
                                <li>
                                    <label>URL</label>
                                    <a href="{{ url($feedBack->additional_1) }}"
                                       target="_blank">{{ url($feedBack->additional_1) }}
                                    </a>
                                </li>
                            @endif
                            @if($feedBack->additional_2)
                                <li>
                                    <label>Agent email</label>
                                    {{ $feedBack->additional_2 }}
                                </li>
                            @endif
                            @if($feedBack->additional_3)
                                <li>
                                    <label>Method of communication</label>
                                    {{ $feedBack->additional_3 }}
                                </li>
                            @endif
                            <li>
                                <label>Status</label> <br>
                                @if ($feedBack->status === 'new')
                                    <span class="label label-primary">new</span>
                                @elseif ($feedBack->status === 'procesed')
                                    <span class="label label-success">procesed</span>
                                @elseif ($feedBack->status === 'cloose')
                                    <span class="label label-danger">cloose</span>
                                @endif
                            </li>
                            @if($feedBack->message)
                                <li>
                                    <label for="message">Message</label>
                                    <textarea type="text" name="message" class="name" id="message"
                                              disabled>{{ $feedBack->message }}</textarea>
                                </li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </form>
    </div>
@stop
<style media="screen">
    td img {
        width: 330px;
    }

    a:hover {
        color: #000 !important;
    }
</style>

