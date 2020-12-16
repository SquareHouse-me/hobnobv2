@extends('voyager::master')

@section('page_title', 'Edit Chat Offer')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-dollar"></i> Edit Chat Offer
        </h1>
    </div>
@stop

@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">

                        <form class="form-edit-add" role="form" action="{{ route('voyager.request-approval-chat-room') }}"
                              method="POST" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            <input value="{{ $chatUpdateRoom->chat_room_id }}" type="hidden" name="chat_room_id">
                            <input value="{{ $chatUpdateRoom->information }}" type="hidden" name="information">
                            <input value="chat-rooms\{{ $chatUpdateRoom->logo }}" type="hidden" name="logo">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-bordered">

                                        <div class="panel-body">
                                            <h3>Information</h3>
                                            <p>{{ $chatUpdateRoom->information }}</p>
                                            <hr>
                                            <h3>Logo</h3>
                                            <img src="{{ asset('storage/chat-rooms/' . $chatUpdateRoom->logo) }}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary pull-right save">
                                Approve
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

