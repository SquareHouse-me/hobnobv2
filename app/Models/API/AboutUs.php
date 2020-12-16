<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class AboutUs extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['content'];

    protected $table = 'about_us';

    protected $fillable = ['content'];
}
