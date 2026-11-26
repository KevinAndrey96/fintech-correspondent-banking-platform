<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class AuthorizeShopkeeperUserController extends Controller
{
    public function __invoke(Request $request)
    {
        $user = User::find($request->input('id'));
        $user->is_authorized = $request->input('authorized');
        if ($user->is_authorized == 0 && $user->role == 'Supplier') {
            $user->is_online = 0;
        }
        $user->save();

        return back();
    }
}
