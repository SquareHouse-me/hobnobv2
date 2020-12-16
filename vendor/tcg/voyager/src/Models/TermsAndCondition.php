<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class TermsAndCondition extends Model
{
    use Translatable;

    protected $translatable = ['content'];

    protected $table = 'terms_and_condition';

    protected $fillable = ['content'];

}
