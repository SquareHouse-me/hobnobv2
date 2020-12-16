<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Models\ChatRooms;
use TCG\Voyager\Traits\Translatable;

class AssignChatRoom extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['chat_room_id'];

    protected $table = 'assign_chat_room';

    protected $fillable = ['chat_room_id'];


}


