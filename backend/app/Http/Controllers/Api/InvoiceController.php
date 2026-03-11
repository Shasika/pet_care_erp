<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Billing\RecordPaymentRequest;
use App\Services\BillingService;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;

class InvoiceController extends Controller
{
    public function recordPayment(RecordPaymentRequest $request, BillingService $billingService): JsonResponse
    {
        $payload = $request->validated();
        $updated = $billingService->applyPayment(['balance' => (float) $payload['balance']], (float) $payload['amount']);

        return response()->json(ApiResponse::success(array_merge($payload, $updated), 'Payment recorded'));
    }
}
