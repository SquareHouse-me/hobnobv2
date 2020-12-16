<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class PrivacyPolicy extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['content'];

    protected $table = 'privacy_policy';

    protected $fillable = ['content'];
}
