<?php

namespace App\Http\Controllers;

use App\Models\Bus;
use Illuminate\Http\Request;

class BusController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Bus::get();
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
            'brand' => 'required',
            'model' => 'required'
        ]);
        return Bus::create([
            'title' => 'Coxs Bazzar Express',
            'brand' => 'Hino',
            'model' => 'CBE 102',
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Bus::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return Bus::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'title' => 'required',
            'brand' => 'required',
            'model' => 'required'
        ]);

        $bus = Bus::findOrFail($id);
        $bus->title = $request->get('title');
        $bus->brand = $request->get('brand');
        $bus->model = $request->get('model');
        $bus->save();
        return $bus;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $bus = Bus::findOrFail($id);
        return $bus->delete();
    }
}
