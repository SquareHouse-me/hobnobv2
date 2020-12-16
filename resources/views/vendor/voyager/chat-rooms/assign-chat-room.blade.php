@extends('voyager::master')

@section('page_title', 'Create Booking')

@section('page_header')
    <?php
        $user = \Illuminate\Support\Facades\DB::table('users')->where('id', $id)->first();
    ?>
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-chat"></i> Assign Chat Room to | {{ $user->name }}
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
                        <?php
                            $checkChatRooms = \Illuminate\Support\Facades\DB::table('assign_chat_room')->get();
                            $checkChatRooms = $checkChatRooms->pluck('chat_room_id')->toArray();
                            $chatRoom = \Illuminate\Support\Facades\DB::table('chat_rooms')->get();
                        ?>
                        <form class="form-edit-add" role="form" action="{{ route('voyager.store.assign.chat.room') }}"
                              method="POST" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            <input value="{{ $id }}" type="hidden" name="user_id">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-bordered">
                                        @if (count($errors) > 0)
                                            <div class="alert alert-danger">
                                                <ul>
                                                    @foreach ($errors->all() as $error)
                                                        <li>{{ $error }}</li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                        @endif
                                        <div class="panel-body">

                                            <div class="form-group">
                                                <label for="status">Chat Rooms Available</label>
                                                <select class="form-control" name="chat_room">
                                                    <option>- Please select chat room -</option>
                                                    @foreach($chatRoom as $chatRooms)
                                                        @if(in_array($chatRooms->id, $checkChatRooms))
                                                        @else
                                                            <option value={{ $chatRooms->id }}>{{ $chatRooms->name }}</option>
                                                        @endif
                                                    @endforeach
                                                </select>
                                                @if($errors->has('person_name'))
                                                    <div style="color: darkred" class="invalid-feedback">
                                                        {{ $errors->first('person_name') }}
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
