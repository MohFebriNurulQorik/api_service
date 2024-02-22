<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CategoryLocation extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['mall_id','name','code'];

    protected $dates = ['deleted_at'];
    protected $connection = 'mysql';
    public function mall()
    {
        return $this->belongsTo(Mall::class);
    }

    public function locations()
    {
        return $this->hasMany(Location::class);
    }
}
