<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/', function (Request $request) {
    return response()->json([
        'status' => 200,
        'message' => 'Laravel Docker Github Actions',
        'Language' => phpversion(),
        'Framework' => config('app.name')
    ]);
});
