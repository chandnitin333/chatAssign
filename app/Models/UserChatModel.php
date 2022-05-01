<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserChatModel extends Model
{
    use HasFactory;
    protected $table = 'user_chat';

    public function userDetails(){
        return $this->hasOne(JobuserModel::class,'id','user_from_id')->select('id','name');
    }
}

