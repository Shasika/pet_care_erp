<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Pharmacy\IssuePrescriptionRequest;
use App\Services\PharmacyService;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;

class PharmacyIssueController extends Controller
{
    public function store(IssuePrescriptionRequest $request, PharmacyService $service): JsonResponse
    {
        $payload = $request->validated();

        foreach ($payload['items'] as $item) {
            $service->validateIssue(['quantity' => 999999], (int) $item['quantity']);
        }

        return response()->json(ApiResponse::success($payload, 'Issue recorded'), 201);
    }
}
