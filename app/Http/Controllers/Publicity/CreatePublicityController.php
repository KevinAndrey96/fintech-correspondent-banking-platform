<?php

namespace App\Http\Controllers\Publicity;

use App\Http\Controllers\Controller;

class CreatePublicityController extends Controller
{
    public function __invoke()
    {
        return view('publicity.create');
    }
}
