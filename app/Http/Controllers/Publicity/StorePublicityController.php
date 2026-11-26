<?php

namespace App\Http\Controllers\Publicity;

use App\Http\Controllers\Controller;
use App\Models\Publicity;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\Request as RequestAlias;

class StorePublicityController extends Controller
{
    public function __invoke(Request $request)
    {
        $fields = [
            'image' => 'required|mimes:jpg,jpeg,png',
        ];

        $message = [
            'required' => ':attribute es requerido',
        ];

        $this->validate($request, $fields, $message);

        $publicityCount = Publicity::where('is_deleted', 0)->get()->count();

        if ($publicityCount >= 5) {
            return back()->with('publicityLimitExceeded', 'Supero el límite máximo de publicidad');
        }

        $publicity = new Publicity;
        $publicity->publicity_url = '';
        $publicity->save();

        if ($request->hasFile('image')) {
            $pathName = sprintf('publicity/%s.png', $publicity->id);
            Storage::disk('public')->put($pathName, file_get_contents($request->file('image')));
            $client = new Client;
            $urlServer = config('services.media_mirror.url');
            $url = $urlServer.'/upload.php';

            $client->request(RequestAlias::METHOD_POST, $url, [
                'multipart' => [
                    [
                        'name' => 'image',
                        'contents' => fopen(
                            str_replace('\\', '/', Storage::path('public\publicity\\'.$publicity->id.'.png')), 'r'),
                    ],
                    [
                        'name' => 'path',
                        'contents' => 'publicity',
                    ],
                ],
            ]);
            $publicity->publicity_url = '/storage/publicity/'.$publicity->id.'.png';
            $publicity->save();
            // unlink(str_replace('\\', '/', storage_path('app/public/publicity/'.$publicity->id.'.png')));
        }

        return redirect()->route('publicity.index');
    }
}
