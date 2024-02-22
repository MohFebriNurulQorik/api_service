<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VisitorCounting extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $fillable = [
        'device_name',
        'device_id_camera',
        'object_type',
        'object_name',
        'object_id',
        'interval',
        'date',
        'start_time',
        'end_time',
        'start_datetime',
        'end_datetime',
        'enters',
        'exits',
        'ip_address',
        'mac_address',
        'http_port',
        'https_port',
        'host_name',
        'time_zone',
        'dst',
        'device_type',
        'serial_number',
        'hw_platform',
        'img',
        'gender',
        'age',
        'status',
        'service_start_time',
        'service_end_time',
        'service_start_datetime',
        'service_end_datetime',
        'seconds_occupied',
        'total_seconds_occupied',
        'category_location_id',
        'location_id',
        'mall_id',
        'device_id',
        'large_visitor_area',
        'kids'
    ];

    public function mall()
    {
        return $this->belongsTo(Mall::class);
    }
    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function device()
    {
        return $this->belongsTo(Device::class);
    }

    public function categoryLocation()
    {
        return $this->belongsTo(CategoryLocation::class);
    }
}
