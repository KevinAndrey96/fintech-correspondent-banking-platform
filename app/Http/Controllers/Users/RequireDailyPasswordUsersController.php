<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;

class RequireDailyPasswordUsersController extends Controller
{
    public function __invoke()
    {
        return view('users.requireDailyPassword');
    }
}
