<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        Transaction::create([
            'user_id' => 4,
            'reservation_id' => 1,
            'type' => 'mobile',
            'trx_phone' => '01730787800',
            'trx_cards' => null,
            'trx_id' => 'abcbz12365abcbz12365abcbz',
            'amount' => 700
        ]);
        return Transaction::orderBy('id', 'desc')->get();
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
            'reservation_id' => 'required',
            'type' => 'required',
            'trx_id' => 'required',
            'amount' => 'required'
        ]);
        return Transaction::create([
            'user_id' => auth()->user()->id,
            'reservation_id' => $request->get('reservation_id'),
            'type' => $request->get('type'),
            'trx_phone' => $request->get('trx_phone'),
            'trx_cards' => $request->get('trx_cards'),
            'trx_id' => $request->get('trx_id'),
            'amount' => $request->get('amount')
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Transaction::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return Transaction::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'reservation_id' => 'required',
            'type' => 'required',
            'trx_id' => 'required',
            'amount' => 'required'
        ]);
        $transaction = Transaction::findOrFail($id);
        $transaction->user_id = auth()->user()->id;
        $transaction->reservation_id = $request->get('reservation_id');
        $transaction->type = $request->get('type');
        $transaction->trx_phone = $request->get('trx_phone');
        $transaction->trx_cards = $request->get('trx_cards');
        $transaction->trx_id = $request->get('trx_id');
        $transaction->amount = $request->get('amount');
        $transaction->save();
        return $transaction;

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $transaction = Transaction::findOrFail($id);
        return $transaction->delete();
    }
}
