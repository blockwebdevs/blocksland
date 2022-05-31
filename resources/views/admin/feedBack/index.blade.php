@extends(' admin.app')
@include(' admin.nav-bar')
@include(' admin.left-menu')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('/back') }}">Control Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Lead Management</li>
        </ol>
    </nav>
    <div class="title-block">
        <h3 class="title">Lead Management</h3>
    </div>
    @include(' admin.alerts')

    @if(!$feedbacks->isEmpty())
        <div class="card">
            <div class="card-block">
                <div class="active-content" id="new">
                    <table class="table table-hover table-striped" id="tablelistsorter">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th class="text-center">Subject</th>
                            <th class="text-center">Status</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($feedbacks as $key => $feedBack)
                            <tr id="{{ $feedBack->id }}">
                                <td>
                                    {{ $key + 1 }}
                                </td>
                                <td>
                                    <b>{{ $feedBack->first_name }}</b>
                                </td>
                                <td>
                                    <small>{{ $feedBack->phone }}</small>
                                </td>
                                <td>
                                    <small>{{ $feedBack->email }}</small>
                                </td>
                                <td class="text-center"><span class="label label-success">{{ $feedBack->subject }}</span></td>
                                <td class="text-center">
                                    @if ($feedBack->status == 'new')
                                        <span class="label label-primary">new</span>
                                    @elseif ($feedBack->status == 'procesed')
                                        <span class="label label-success">procesed</span>
                                    @elseif ($feedBack->status == 'cloose')
                                        <span class="label label-danger">cloose</span>
                                    @endif
                                </td>
                                <td>
                                    <a href="{{ route('feedback.edit', $feedBack->id) }}">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                </td>
                                <td class="destroy-element">
                                    <form action="{{ route('feedback.destroy', $feedBack->id) }}" method="post">
                                        {{ csrf_field() }} {{ method_field('DELETE') }}
                                        <button type="submit" class="btn-link">
                                            <a href=""><i class="fa fa-trash"></i></a>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan=8></td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    @else
        <div class="empty-response">List is empty</div>
    @endif
@stop
