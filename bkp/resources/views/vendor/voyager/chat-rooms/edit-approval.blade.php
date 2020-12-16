@extends('voyager::master')

@section('page_title', 'Edit Chat Room')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-dollar"></i> Edit Chat Room
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

                        <form id="booking-add" class="form-edit-add" role="form" action="{{ route('voyager.update-approval-chat-room') }}"
                              method="POST" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            <input value="{{ $chatRoom->id }}" type="hidden" name="id">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-bordered">

                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label for="information">Information</label>
                                                <textarea name="information" class="form-control">{{ $chatRoom->information }}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="image">Logo</label>
                                                <input type="file" name="image" class="form-control" accept="image/*">
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

