<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\PharmacyService;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class PharmacyIssueController extends Controller
{
    public function store(Request $request, PharmacyService $service): JsonResponse
    {
        $payload = $request->validate([
            'batch.quantity' => ['required', 'integer'],
            'quantity' => ['required', 'integer'],
        ]);

        $service->validateIssue(['quantity' => $payload['batch']['quantity']], $payload['quantity']);

        return response()->json(ApiResponse::success($payload, 'Issue recorded'), 201);
    }
}
