<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class ChatRooms extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['name', 'logo', 'cover_picture', 'information', 'chat_room_type', 'lat', 'long', 'business_type', 'chat_room_area', 'status', 'working_start_hours', 'working_end_hours', 'radius'];

    protected $table = 'chat_rooms';

    protected $fillable = ['name', 'logo', 'cover_picture', 'information', 'chat_room_type', 'lat', 'long', 'business_type', 'chat_room_area', 'status', 'working_start_hours', 'working_end_hours', 'radius', 'uuid'];
}
