<?php

namespace App\Http\Controllers\Platforms;

use App\Http\Controllers\Controller;
use App\Models\Platform;
use Illuminate\Http\Request;

class LockPlatformController extends Controller
{
    public function __invoke(Request $request)
    {
        $platform = Platform::find($request->input('id'));
        $platform->is_enabled = $request->input('status');
        $platform->save();

        return redirect('/home');

    }
}
