<?php

namespace App\Http\Controllers\Chats;

use App\Http\Controllers\Controller;

class indexChatsController extends Controller
{
    public function __invoke($id)
    {
        return view('transactions.chat', ['id' => $id]);
    }
}
