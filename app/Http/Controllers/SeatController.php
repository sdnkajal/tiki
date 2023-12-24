<?php

namespace App\Http\Controllers;

use App\Models\Seat;
use Illuminate\Http\Request;

class SeatController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Seat::orderBy('id', 'desc')->get();
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
            'row' => 'required',
            'column' => 'required',
        ]);
        return Seat::create([
            'row' => $request->get('row'),
            'column' => $request->get('column')
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Seat::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return Seat::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'row' => 'required',
            'column' => 'required',
        ]);
        $seat = Seat::findOrFail($id);
        $seat->row = $request->get('row');
        $seat->column = $request->get('column');
        $seat->save();
        return Seat::findOrFail($id);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $seat =  Seat::findOrFail($id);
        return $seat->delete();
    }
}
