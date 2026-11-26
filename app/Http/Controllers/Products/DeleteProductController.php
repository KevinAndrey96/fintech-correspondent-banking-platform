<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use App\Models\Product;

class DeleteProductController extends Controller
{
    public function __invoke($id)
    {
        $product = Product::find($id);
        $product->is_deleted = 1;
        $product->save();

        return back()->with('satisfactoryProductDisposal', 'Eliminación de producto satisfactoria');

    }
}
