<?php

namespace App\Http\Controllers\Answers;

use App\Http\Controllers\Controller;

class CreateAnswersController extends Controller
{
    public function __invoke()
    {
        return view('answers.create');
    }
}
