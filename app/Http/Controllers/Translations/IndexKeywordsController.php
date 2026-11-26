<?php

namespace App\Http\Controllers\Translations;

use App\Http\Controllers\Controller;

class IndexKeywordsController extends Controller
{
    public function __invoke()
    {
        return view('translations.keywords');
    }
}
