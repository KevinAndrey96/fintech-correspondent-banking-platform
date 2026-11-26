<?php

namespace App\Http\Controllers\Banners;

use App\Http\Controllers\Controller;

class CreateBannersController extends Controller
{
    public function __invoke()
    {
        return view('banners.create');
    }
}
