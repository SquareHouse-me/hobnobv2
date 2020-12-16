<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class ChatRoom extends Model
{
    use Translatable;

    protected $translatable = ['name', 'information'];

    protected $table = 'chat_rooms';

    protected $fillable = ['name', 'information', 'uuid'];

}
