<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ExtraInfoDistributorMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (session('impersonated_by')) {

            return $next($request);
        }

        $user = User::find(Auth::user()->id);

        if ($user->role == 'Shopkeeper' && $user->extrainfo == 0) {

            $rutName = config('platform.rut_name');

            return redirect()->route('distributor.extrainfo')->with('rutName', $rutName);
        }

        return $next($request);
    }
}
