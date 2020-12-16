<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class Flyer extends Model
{
    use Translatable;

    protected $translatable = ['description'];

    protected $table = 'flyers';

    protected $fillable = ['description'];

}
