<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;

class DailyPasswordIndexUsersController extends Controller
{
    public function __invoke()
    {
        return view('users.dailyPassword');
    }
}
