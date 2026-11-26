<?php

namespace App\Http\Controllers\Transactions;

use App\Http\Controllers\Controller;
use App\Models\Answer;
use App\Models\Summary;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DetailTransactionController extends Controller
{
    public function detail($id, Request $request)
    {
        $detailSupplier = $request->input('detail');
        $callSign = config('platform.country_code');
        $urlServer = config('services.media_mirror.url');
        $transaction = Transaction::find($id);
        $summariesCount = Summary::where('movement_id', $transaction)->count();

        if ($transaction->status == 'accepted' && Auth::user()->role == 'Supplier' && $transaction->supplier_id != Auth::user()->id) {

            return redirect('/home')->with('transactionAccepted', 'La transacción ya ha sido aceptada por otro proveedor');
        }

        $extras = explode(',', $transaction->detail);

        if (Auth::user()->role == 'Supplier' && is_null($detailSupplier) && ($transaction->status == 'hold' || $transaction->status == 'accepted')) {
            $transaction->status = 'accepted';
            $answers = Answer::where('is_deleted', 0)->get();
            $transaction->save();

            return view('transactions.detail', compact('transaction', 'extras', 'detailSupplier', 'callSign', 'urlServer', 'answers', 'summariesCount'));
        }
        if (Auth::user()->role == 'Supplier' && ! is_null($detailSupplier)) {

            return view('transactions.detail', compact('transaction', 'extras', 'detailSupplier', 'callSign', 'urlServer', 'summariesCount'));
        }
        if (Auth::user()->role == 'Shopkeeper' || Auth::user()->role == 'Administrator') {

            return view('transactions.detail', compact('transaction', 'extras', 'callSign', 'urlServer'));
        }
    }
}
