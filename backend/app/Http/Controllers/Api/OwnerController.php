<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreOwnerRequest;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;

class OwnerController extends Controller
{
    public function index(): JsonResponse
    {
        return response()->json(ApiResponse::success([
            ['id' => 1, 'full_name' => 'Sara Lee', 'phone' => '+1 123 555 2010'],
        ], 'Owners list', ['total' => 1]));
    }

    public function store(StoreOwnerRequest $request): JsonResponse
    {
        return response()->json(ApiResponse::success($request->validated(), 'Owner created'), 201);
    }
}
