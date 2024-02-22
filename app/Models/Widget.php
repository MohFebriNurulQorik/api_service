<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Widget extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $connection = 'mysql';
    protected $dates = ['deleted_at'];
    protected $fillable = [
        'company_id',
        'name',
        'type_chart',
        'reload_time',
        'widget_name',
        'dimensi',
        'style',
        'visibility_status',
    ];
}
