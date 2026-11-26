<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use App\Models\ProductField;

class EditFieldsProductsController extends Controller
{
    public function __invoke()
    {
        $productFields = ProductField::first();

        return view('product.editFields', compact('productFields'));
    }
}
