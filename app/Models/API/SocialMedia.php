<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class socialmedia extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['facebook','instagram','twitter'];

    protected $table = 'social_media_links';

    protected $fillable = ['facebook','instagram','twitter'];
}
