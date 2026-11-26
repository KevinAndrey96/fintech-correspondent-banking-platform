<?php

namespace App\Http\Controllers\Banners;

use App\Http\Controllers\Controller;
use App\Models\Banner;

class indexBannersController extends Controller
{
    public function __invoke()
    {
        $banners = Banner::all();
        $urlServer = config('services.media_mirror.url');

        return view('banners.index', compact('banners', 'urlServer'));

    }
}
