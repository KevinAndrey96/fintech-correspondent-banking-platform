<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;

class DistributorExtrainfoUsersController extends Controller
{
    public function __invoke()
    {
        return view('users.distributorExtrainfo');
    }
}
