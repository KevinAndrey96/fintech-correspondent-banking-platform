<?php

namespace App\Http\Controllers\Transactions;

use App\Http\Controllers\Controller;
use App\Models\Transaction;

class LoadTransactionController extends Controller
{
    public function load($id)
    {
        $transaction = Transaction::find($id);
        $url = config('services.media_mirror.url');
        $pathBackground = config('platform.load_background');

        return view('transactions.load', compact('transaction', 'url', 'pathBackground'));
    }
}
