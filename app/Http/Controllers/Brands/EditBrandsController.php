<?php

namespace App\Http\Controllers\Brands;

use App\Http\Controllers\Controller;
use App\Models\Brand;

class EditBrandsController extends Controller
{
    public function __invoke($id)
    {
        $brand = Brand::find($id);

        return view('brands.edit', ['brand' => $brand]);
    }
}
