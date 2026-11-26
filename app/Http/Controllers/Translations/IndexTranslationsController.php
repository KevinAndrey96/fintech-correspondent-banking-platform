<?php

namespace App\Http\Controllers\Translations;

use App\Http\Controllers\Controller;

class IndexTranslationsController extends Controller
{
    public function __invoke()
    {
        return view('translations.index');
    }
}
