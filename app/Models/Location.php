<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Location extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $connection = 'mysql';
    protected $fillable = [
        'mall_id',
        'category_location_id',
        'floor',
        'coordinate_x',
        'coordinate_y',
        'image1',
        'image2',
        'image3',
        'description',
    ];

    public function mall()
    {
        return $this->belongsTo(Mall::class);
    }

    public function categoryLocation()
    {
        return $this->belongsTo(CategoryLocation::class);
    }


    public function devices()
    {
        return $this->hasMany(Device::class);
    }

    protected $dates = ['deleted_at'];
}
