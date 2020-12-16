<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class AppUser extends Model
{

    protected $table = 'app_users';

    protected $fillable = [
        'username', 'image', 'email', 'phone', 'gender', 'dob', 'password', 'lat', 'long', 'code', 'status'
    ];

}
