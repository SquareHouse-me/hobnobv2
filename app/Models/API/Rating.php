<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Rating extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['user_id','chatroom_id','Rating'];

    protected $table = 'rating';

    protected $fillable = ['user_id','chatroom_id','Rating'];
}
