<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;

class PersonalizeLoginUserController extends Controller
{
    public function __invoke(Request $request)
    {
        $brand = $request->input('brand');

        if (isset($brand)) {
            $brand = Brand::where('domain', $brand)->first();

            return view('auth.login', ['brand' => $brand]);
        }

        return view('auth.login');

    }
}
