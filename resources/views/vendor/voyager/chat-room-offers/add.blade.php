@extends('voyager::master')

@section('page_title', 'Create Chat Offer')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-dollar"></i> Create Chat Offer
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

                        <form id="booking-add" class="form-edit-add" role="form" action="{{ route('voyager.store-new-chat-offers') }}"
                              method="POST" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            <input value="{{ $id }}" type="hidden" name="chat_room_id">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-bordered">

                                        <div class="panel-body">

                                            <div class="form-group">
                                                <label for="image">Image</label>
                                                <input name="image" type="file" class="form-control" accept="image/*" >
                                                @if($errors->has('image'))
                                                    <div style="color: darkred" class="invalid-feedback">
                                                        {{ $errors->first('image') }}
                                                    </div>
                                                @endif
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

