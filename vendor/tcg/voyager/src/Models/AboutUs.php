<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class AboutUs extends Model
{
    use Translatable;

    protected $translatable = ['content'];

    protected $table = 'about_us';

    protected $fillable = ['content'];

}
