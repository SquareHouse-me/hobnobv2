<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class Notification extends Model
{
    use Translatable;

    protected $translatable = ['message_title' , 'message_body'];

    protected $table = 'notification';

    protected $fillable = ['message_title' , 'message_body'];

}
