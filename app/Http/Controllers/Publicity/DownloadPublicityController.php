<?php

namespace App\Http\Controllers\Publicity;

use App\Http\Controllers\Controller;

class DownloadPublicityController extends Controller
{
    public function __invoke($id)
    {
        $urlServer = config('services.media_mirror.url');

        return response()->download(storage_path('app/public/publicity/'.$id.'.png'));
    }
}
