<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\BillingService;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function recordPayment(Request $request, BillingService $billingService): JsonResponse
    {
        $payload = $request->validate([
            'balance' => ['required', 'numeric', 'min:0'],
            'amount' => ['required', 'numeric', 'min:0.01'],
        ]);

        $updated = $billingService->applyPayment(['balance' => (float) $payload['balance']], (float) $payload['amount']);

        return response()->json(ApiResponse::success($updated, 'Payment recorded'));
    }
}
