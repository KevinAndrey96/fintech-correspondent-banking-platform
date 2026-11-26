<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\Request;

class GetstatusController extends Controller
{
    /**
     * Return the transaction polled by the waiting screen, only to the users involved in it.
     */
    public function index(Request $request, $id)
    {
        $user = $request->user();
        $transaction = Transaction::findOrFail($id);

        $isParticipant = in_array($user->id, [
            $transaction->shopkeeper_id,
            $transaction->distributor_id,
            $transaction->supplier_id,
        ], false);

        abort_unless($isParticipant || $user->role === 'Administrator', 404);

        return $transaction;
    }
}
