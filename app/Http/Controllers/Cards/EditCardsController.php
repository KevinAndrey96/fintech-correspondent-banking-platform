<?php

namespace App\Http\Controllers\Cards;

use App\Http\Controllers\Controller;
use App\Models\Card;

class EditCardsController extends Controller
{
    public function __invoke($id)
    {
        $card = Card::find($id);

        return view('cards.edit', ['card' => $card]);
    }
}
