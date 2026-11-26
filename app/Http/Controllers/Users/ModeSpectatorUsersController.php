<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class ModeSpectatorUsersController extends Controller
{
    public function __invoke($id, $isInspector)
    {
        $user = User::find($id);

        if ($isInspector == 1) {
            $user = User::find($id);
            $user->qr = 0;
            $user->backup_google2fa_secret = $user->google2fa_secret;
            $user->save();

            Auth::user()->impersonate($user);

            return redirect()->route('complete.registration');
        }

        $userRole = Auth::user()->role;

        Auth::user()->leaveImpersonation();

        if ($userRole == 'Distributor' || $userRole == 'Supplier') {

            return redirect('/users?role='.$userRole);
        }

        return redirect('/users?role=allShopkeepers');
    }
}
