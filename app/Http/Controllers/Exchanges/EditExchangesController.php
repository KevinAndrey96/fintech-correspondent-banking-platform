<?php

namespace App\Http\Controllers\Exchanges;

use App\Http\Controllers\Controller;
use App\Models\Exchange;

class EditExchangesController extends Controller
{
    public function __invoke($id)
    {
        $exchange = Exchange::find($id);

        return view('exchanges.edit', compact('exchange'));
    }
}
