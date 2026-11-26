<?php

namespace App\Http\Controllers\Transactions;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Barryvdh\DomPDF\Facade\Pdf;

class DetailTransactionPDFController extends Controller
{
    public function detailPDF($id)
    {
        $transaction = Transaction::find($id);
        $extras = explode(',', $transaction->detail);
        $url = config('services.media_mirror.url');

        $pdf = PDF::loadView('transactions.detailPDF', ['transaction' => $transaction, 'extras' => $extras, 'url' => $url]);
        $pdf->setPaper([0, 0, 141.732, 300], 'portrait'); // setPaper(tamaño 5cmx10cm,vertical)

        return $pdf->stream();

    }
}
