<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Notification extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['message_title','message_body'];

    protected $table = 'notification';

    protected $fillable = ['message_title','message_body','notification_image','url', 'status'];
}
