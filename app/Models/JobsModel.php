<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobsModel extends Model
{
    use HasFactory;
    protected $table = 'jobs';

    public function username(){
        return $this->belongsTo(JobuserModel::class,'user_name','id');
    }

    public function userDetails(){
        return $this->hasOne(JobuserModel::class,'id','user_name');
    }
}
