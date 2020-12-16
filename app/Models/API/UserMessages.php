<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class UserMessages extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['message_id','sender_id'];

    protected $table = 'user_messages';

    protected $fillable = ['message_id','sender_id'];
}
