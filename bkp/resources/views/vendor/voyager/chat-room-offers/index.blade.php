@extends('voyager::master')

@section('page_title', 'Chat Offers')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-dollar"></i> Chat Offers
        </h1>
        <a href="{{ route('voyager.add-new-chat-offers', $id) }}" class="btn btn-success btn-add-new">
            <i class="voyager-plus"></i> <span>Add New</span>
        </a>
    </div>
@stop

@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <table class="table table-bordered table-hover dt-responsive">
                            <thead>
                            <tr>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Requested by</th>
                                <th>Requested at</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($chatOffer as $chatOffers)
                                <tr>
                                    <td><img src="{{ asset('storage/chat-offers/' . $chatOffers->image) }}" height="150"
                                             width="150"></td>
                                    <td>{{ $chatOffers->status ?? '' }}</td>
                                    <td>{{ $chatOffers->name ?? '' }}</td>
                                    <td>{{ $chatOffers->created_at ?? '' }}</td>
                                    <td style="width: 20%">
                                        @if(auth()->user()->role_id == 2)
                                            <a href="{{ route('voyager.edit-new-chat-offers', $chatOffers->id) }}" class="btn btn-primary btn-xs" style="text-decoration: none">
                                                <i style="padding-right: 5px" class="voyager-edit"></i><span>Edit</span>
                                            </a>
                                        @endif
                                        <a href="{{ route('voyager.read-new-chat-offers', $chatOffers->id) }}" class="btn btn-warning btn-xs" style="text-decoration: none">
                                            <i style="padding-right: 5px" class="voyager-list"></i><span>View</span>
                                        </a>
                                    </td>

                                </tr>
                            @endforeach
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

@section('javascript')
    <!-- DataTables -->

    <script>
        $('table').DataTable();
    </script>
@stop
