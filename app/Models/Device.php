<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Device extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['model', 'serial', 'image', 'category_location_id', 'location_id', 'mall_id','code'];
    protected $connection = 'mysql';

    public function categoryLocation()
    {
        return $this->belongsTo(CategoryLocation::class);
    }

    // Define the relationship with the Location model
    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    // Define the relationship with the Mall model
    public function mall()
    {
        return $this->belongsTo(Mall::class);
    }

    protected $dates = ['deleted_at'];
}
