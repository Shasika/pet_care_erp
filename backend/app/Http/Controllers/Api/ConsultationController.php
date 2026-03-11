<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Consultations\StoreConsultationRequest;
use App\Services\Consultations\ConsultationService;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;

class ConsultationController extends Controller
{
    public function store(StoreConsultationRequest $request, ConsultationService $service): JsonResponse
    {
        $consultation = $service->create($request->validated());

        return response()->json(ApiResponse::success($consultation, 'Consultation created'), 201);
    }
}
