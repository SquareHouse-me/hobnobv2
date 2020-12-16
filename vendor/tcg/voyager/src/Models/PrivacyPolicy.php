<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class PrivacyPolicy extends Model
{
    use Translatable;

    protected $translatable = ['content'];

    protected $table = 'privacy_policy';

    protected $fillable = ['content'];

}
