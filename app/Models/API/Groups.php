<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Groups extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['name'];

    protected $table = 'groups';

    protected $fillable = ['name'];
}
