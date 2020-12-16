<?php

namespace App\Models\API;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class ReportingUsers extends Model
{
    use Translatable;
    use HasFactory;

    protected $translatable = ['userid','against_id','complain_number','status'];

    protected $table = 'reportingusers';

    protected $fillable = ['userid','against_id','complain_number','status'];
}