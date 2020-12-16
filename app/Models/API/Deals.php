<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Deals extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['image','url'];

    protected $table = 'deals';

    protected $fillable = ['image','url'];
}
