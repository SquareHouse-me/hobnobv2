<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class ContactUs extends Model
{
    use Translatable;

    protected $translatable = ['name'];

    protected $table = 'contact_us';

    protected $fillable = ['name'];

}
