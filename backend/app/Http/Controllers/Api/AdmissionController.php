<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admissions\DischargeAdmissionRequest;
use App\Services\Admissions\DischargeService;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;

class AdmissionController extends Controller
{
    public function discharge(DischargeAdmissionRequest $request, DischargeService $service): JsonResponse
    {
        $result = $service->discharge(['id' => 1], $request->validated());

        return response()->json(ApiResponse::success($result, 'Admission discharged'));
    }
}
