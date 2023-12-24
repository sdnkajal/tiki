<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Reservation::orderBy('id', 'desc')->get();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return 'Form under contraction';
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'bus_id' => 'required',
            'trip_id' => 'required',
            'fare' => 'required',
            'place' => 'required',
            'destination' => 'required',
            'departure_time' => 'required',
            'arrival_time' => 'required',
        ]);
        return Reservation::create([
            'user_id' => auth()->user()->id,
            'bus_id' => $request->get('bus_id'),
            'trip_id' => $request->get('trip_id'),
            'fare' => $request->get('fare'),
            'place' => $request->get('place'),
            'destination' => $request->get('destination'),
            'departure_time' => $request->get('departure_time'),
            'arrival_time' => $request->get('arrival_time')
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Reservation::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return Reservation::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'bus_id' => 'required',
            'trip_id' => 'required',
            'fare' => 'required',
            'place' => 'required',
            'destination' => 'required',
            'departure_time' => 'required',
            'arrival_time' => 'required',
        ]);
        $reservation = Reservation::findOrFail($id);
        $reservation->user_id = auth()->user()->id;
        $reservation->bus_id = $request->get('bus_id');
        $reservation->trip_id = $request->get('trip_id');
        $reservation->fare = $request->get('fare');
        $reservation->place = $request->get('place');
        $reservation->destination = $request->get('destination');
        $reservation->departure_time = $request->get('departure_time');
        $reservation->arrival_time = $request->get('arrival_time');
        $reservation->save();

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $reservation = Reservation::findOrFail($id);
        return $reservation->delete();
    }
}
