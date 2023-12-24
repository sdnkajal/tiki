<?php

namespace App\Http\Controllers;

use App\Models\Trip;
use Illuminate\Http\Request;

class TripController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Trip::get();
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
            'departure' => 'required'
        ]);
        return Trip::create([
            'bus_id' => $request->get('bus_id'),
            'departure' => $request->get('departure')
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Trip::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return Trip::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'bus_id' => 'required',
            'departure' => 'required'
        ]);
        $trip = Trip::findOrFail($id);
        $trip->bus_id = $request->get('bus_id');
        $trip->departure = $request->get('departure');
        $trip->save();
        return $trip;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $trip = Trip::findOrFail($id);
        return $trip->delete();
    }
}
