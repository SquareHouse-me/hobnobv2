<?php

namespace TCG\Voyager\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

class SocialMediaLink extends Model
{
    protected $table = 'social_media_links';

    protected $fillable = ['facebook', 'instagram', 'twitter'];
}
