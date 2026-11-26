<?php

namespace App\Http\Controllers\Balances;

use App\Http\Controllers\Controller;
use App\Models\Card;
use Illuminate\Support\Facades\Auth;

class CreateBalanceController extends Controller
{
    public function create()
    {
        if (Auth::user()->role == 'Shopkeeper' or Auth::user()->role == 'Supplier') {
            $cards = Card::all();
            $urlServer = config('services.media_mirror.url');
            $countryName = config('platform.country_name');

            return view('balance.addBalanceShopkeeper', compact('cards', 'urlServer', 'countryName'));
        }
    }
}
