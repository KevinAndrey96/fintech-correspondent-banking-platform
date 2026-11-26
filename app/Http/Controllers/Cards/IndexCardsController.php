<?php

namespace App\Http\Controllers\Cards;

use App\Http\Controllers\Controller;
use App\Models\Card;

class IndexCardsController extends Controller
{
    public function __invoke()
    {
        $cards = Card::all();
        $urlServer = config('services.media_mirror.url');

        return view('cards.index', compact('cards', 'urlServer'));
    }
}
