@extends('voyager::master')

@section('page_title', 'Chat Offer')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-dollar"></i> Chat Offer
        </h1>
    </div>
@stop

@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-heading" style="border-bottom:0;">
                        <h3 class="panel-title">Chat Offer Details</h3>
                    </div>
                    <div class="panel-body">
                        <h5>Image</h5>
                        <img src="{{ asset('storage/chat-offers/' . $chatOffer->image) }}">
                        <hr>
                        <h5>Status</h5>
                        <p>{{ $chatOffer->status ?? '' }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop
