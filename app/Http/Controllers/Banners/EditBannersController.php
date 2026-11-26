<?php

namespace App\Http\Controllers\Banners;

use App\Http\Controllers\Controller;
use App\Models\Banner;

class EditBannersController extends Controller
{
    public function __invoke($id)
    {
        $banner = Banner::find($id);

        return view('banners.edit', compact('banner'));
    }
}
