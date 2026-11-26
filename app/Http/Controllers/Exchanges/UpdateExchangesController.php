<?php

namespace App\Http\Controllers\Exchanges;

use App\Http\Controllers\Controller;
use App\Models\Exchange;
use Illuminate\Http\Request;

class UpdateExchangesController extends Controller
{
    public function __invoke(Request $request)
    {
        $exchange = Exchange::find($request->input('exchangeID'));
        $exchange->badge = $request->input('badge');
        $exchange->value = $request->input('value');
        $exchange->save();

        return redirect()->route('exchanges.index');
    }
}
