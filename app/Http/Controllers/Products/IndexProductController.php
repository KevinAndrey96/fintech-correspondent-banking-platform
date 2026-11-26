<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use App\Models\Product;

class IndexProductController extends Controller
{
    public function index()
    {
        $products = Product::where('is_deleted', 0)->get();
        $urlServer = config('services.media_mirror.url');
        $url = $urlServer;

        return view('product.index', compact('products', 'url'));
    }
}
