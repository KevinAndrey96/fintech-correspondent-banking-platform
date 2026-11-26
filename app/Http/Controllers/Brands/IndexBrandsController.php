<?php

namespace App\Http\Controllers\Brands;

use App\Http\Controllers\Controller;
use App\Models\Brand;

class IndexBrandsController extends Controller
{
    public function __invoke()
    {
        $brands = Brand::all();

        return view('brands.index', ['brands' => $brands]);
    }
}
