<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Mall extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $connection = 'mysql';
    protected $fillable = [
        'name', 'code', 'city', 'address', 'type_store', 'latitude', 'longitude', 'logo','large_visitor_area'
    ];
    protected $dates = ['deleted_at'];
}
