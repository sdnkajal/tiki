<?php

namespace App\Http\Controllers;

use App\Models\SeatAllocation;
use Illuminate\Http\Request;

class SeatAllocationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        return SeatAllocation::orderBy('id', 'desc')->get();
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
            'trip_id' => 'required'
        ]);
        for ($i = 1; $i < 37; $i++) {
            SeatAllocation::create([
                'trip_id' => $request->get('trip_id'),
                'seat_id' => $i
            ]);
        }
        return SeatAllocation::Where('trip_id', '=', $request->get('trip_id'))
            ->orderBy('id', 'desc')
            ->get();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return SeatAllocation::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return SeatAllocation::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'status' => 'required',
        ]);
        $seatAllocation = SeatAllocation::findOrFail($id);
        $seatAllocation->status = $request->get('status');
        $seatAllocation->save();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $seatAllocation = SeatAllocation::findOrFail($id);
        return $seatAllocation->delete();
    }
}
