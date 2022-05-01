<?php

namespace Database\Seeders;

use App\Models\User as ModelsUser;
use Illuminate\Database\Seeder;
// use App\User;

class UsersTablesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        ModelsUser::create([
            'name'    => 'user1',
            'email'    => 'user1@gmail.com',
            'password'   =>  Hash::make('user1'),
            'remember_token' =>  str_random(10),
        ]);
    }
}
