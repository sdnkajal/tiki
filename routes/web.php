<?php

use App\Http\Controllers\BusController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\SeatAllocationController;
use App\Http\Controllers\SeatController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\TripController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('welcome');
});

Route::resource('users', UserController::class);
Route::resource('locations', LocationController::class);
Route::resource('buses', BusController::class);
Route::resource('seats', SeatController::class);
Route::resource('trips', TripController::class);
Route::resource('seat-allocations', SeatAllocationController::class);
Route::resource('reservations', ReservationController::class);
Route::resource('transactions', TransactionController::class);
