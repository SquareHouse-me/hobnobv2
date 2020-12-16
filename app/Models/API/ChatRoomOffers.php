<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class ChatRoomOffers extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = [''];

    protected $table = 'chat_room_offers';

    protected $fillable = ['image','status','chat_room_id','user_id'];
}
