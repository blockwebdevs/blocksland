<?php

namespace App\Models;

use App\Base as Model;

class Agent extends Model
{
    protected $table = 'agents';

    protected $fillable = ['name', 'email', 'phone', 'telegram', 'job', 'image', 'position'];

    public function products()
    {
        return $this->hasMany(Product::class, 'agent_id', 'id');
    }
}
