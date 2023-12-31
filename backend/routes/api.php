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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['cors', 'json.response']], function () {
    Route::post('/login', 'Api\LoginController@login');
});

Route::group(['middleware' => ['cors', 'json.response', 'auth:api']], function () {
    Route::get('/get-location','Api\ProductController@getLocation');
    Route::get('/get-categories','Api\ProductController@getCategory');
    Route::get('/get-products','Api\ProductController@getProduct');
});
