<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeviceToken extends Model
{

    protected $table = 'device_token';

    protected $fillable = ['user_id' , 'device' , 'token'];
}
