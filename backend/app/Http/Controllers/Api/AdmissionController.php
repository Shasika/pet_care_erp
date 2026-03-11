<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;

class AdmissionController extends Controller
{
    public function discharge(): JsonResponse
    {
        return response()->json(ApiResponse::success(null, 'Admission discharged'));
    }
}
