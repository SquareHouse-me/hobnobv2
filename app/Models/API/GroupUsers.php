<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class GroupUsers extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['group_id','user_id'];

    protected $table = 'group_user';

    protected $fillable = ['group_id','user_id'];
}
