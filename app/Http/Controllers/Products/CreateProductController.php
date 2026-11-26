<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use App\Models\ProductField;

class CreateProductController extends Controller
{
    public function create()
    {
        $productFields = ProductField::first();

        return view('product.create', compact('productFields'));
    }
}
