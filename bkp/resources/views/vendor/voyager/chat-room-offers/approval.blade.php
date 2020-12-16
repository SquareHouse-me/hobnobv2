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

                        <form class="form-edit-add" role="form" action="{{ route('voyager.update-new-chat-offers') }}"
                              method="POST" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            <input value="{{ $chatOffer->id }}" type="hidden" name="id">
                            <input value="{{ $chatOffer->chat_room_id }}" type="hidden" name="chat_room_id">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-bordered">

                                        <div class="panel-body">

                                            <div class="form-group">
                                                <label for="image">Status</label>
                                                <select class="form-control" name="status">
                                                    @if($chatOffer->status == 'Not Approved')
                                                        <option value="Not Approved" selected>Not Approved</option>
                                                        <option value="Approved">Approved</option>
                                                    @else
                                                        <option value="Not Approved">Not Approved</option>
                                                        <option value="Approved" selected>Approved</option>
                                                    @endif
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary pull-right save">
                                Save
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

