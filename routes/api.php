<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/getCountryName', [App\Http\Controllers\GetCountryNameController::class, 'index']);

// APIS for the transaction section
Route::post('v1/user/login', App\Http\Controllers\API\Users\LoginUsersController::class)->name('api.user-login');

Route::middleware('auth:api')->group(function () {
    Route::get('v1/products', App\Http\Controllers\API\Products\GetProductsController::class)->name('api.products');
    Route::post('v1/transaction/create', App\Http\Controllers\API\Transactions\CreateTransactionsController::class)->name('transactions.create');
    Route::get('v1/transaction/detail/{id}', App\Http\Controllers\API\Transactions\DetailTransactionsController::class)->name('transactions.detail');
    Route::get('v1/transactions/user', App\Http\Controllers\API\Transactions\GetAllByUserTransactionsController::class)->name('transactions.show-all-by-user');

});
