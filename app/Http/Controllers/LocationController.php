<?php

namespace App\Http\Controllers;

use App\Models\Location;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Location::get();
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
            'title' => 'required',
            'uptime' => 'required',
            'downtime' => 'required',
            'up_fare' => 'required',
            'down_fare' => 'required'
        ]);
        return Location::create([
            'title' => $request->get('title'),
            'uptime' => $request->get('uptime'),
            'downtime' => $request->get('downtime'),
            'up_fare' => $request->get('up_fare'),
            'down_fare' => $request->get('down_fare')
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Location::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return Location::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'title' => 'required',
            'uptime' => 'required',
            'downtime' => 'required',
            'up_fare' => 'required',
            'down_fare' => 'required'
        ]);
        $location = Location::findOrFail($id);
        $location->title = $request->get('title');
        $location->uptime = $request->get('uptime');
        $location->downtime = $request->get('downtime');
        $location->up_fare = $request->get('up_fare');
        $location->down_fare = $request->get('down_fare');
        $location->save();
        return $location;

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $location = Location::findOrFail($id);
        $location->delete();
    }
}
