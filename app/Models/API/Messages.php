<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Messages extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['parent_id'];

    protected $table = 'messages';

    protected $fillable = ['parent_id'];
}
