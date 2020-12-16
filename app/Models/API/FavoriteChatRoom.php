<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class FavoriteChatRoom extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['userid','chatroomid','chatroom_image','status','Gender'];

    protected $table = 'favorite_chatrooms';

    protected $fillable = ['userid','chatroomid','chatroom_image','status','Gender'];
}
