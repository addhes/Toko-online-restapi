<?php

use App\Http\Controllers\API\FotoProdukController;
use App\Http\Controllers\API\FotoTokoController;
use App\Http\Controllers\API\ProdukController;
use App\Http\Controllers\API\TokoController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;
use App\Models\FotoProduk;
use App\Models\FotoToko;

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


Route::post('register', [UserController::class, 'register']);
Route::post('login', [UserController::class, 'login']);

Route::middleware('auth:sanctum')->group(function (){
    Route::post('user', [UserController::class, 'updateprofile']);
    Route::post('logout', [UserController::class, 'logout']);

    Route::get('toko', [TokoController::class, 'all']);
    Route::post('toko', [TokoController::class, 'create']);
    Route::delete('toko/{id}', [TokoController::class, 'destroy']);
    Route::post('toko/{id}', [TokoController::class, 'update']);

    Route::get('fototoko', [FotoTokoController::class, 'all']);
    Route::post('fototoko', [FotoTokoController::class, 'uploadfoto']);
    Route::post('fototoko/{id}', [FotoTokoController::class, 'update']);
    Route::delete('fototoko/{id}', [FotoTokoController::class, 'destroy']);

    Route::get('produk', [ProdukController::class, 'all']);
    Route::post('produk', [ProdukController::class, 'create']);
    Route::post('produk/{id}', [ProdukController::class, 'update']);
    Route::delete('produk/{id}', [ProdukController::class, 'destroy']);

    Route::get('fotoproduk', [FotoProdukController::class, 'all']);
    Route::post('fotoproduk', [FotoProdukController::class, 'uploadfoto']);
    Route::post('fotoproduk/{id}', [FotoProdukController::class, 'update']);
    Route::delete('fotoproduk/{id}', [FotoProdukController::class, 'destroy']);
});