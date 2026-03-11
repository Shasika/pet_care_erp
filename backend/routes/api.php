<?php

use App\Http\Controllers\Api\AdmissionController;
use App\Http\Controllers\Api\ConsultationController;
use App\Http\Controllers\Api\InvoiceController;
use App\Http\Controllers\Api\OwnerController;
use App\Http\Controllers\Api\PetController;
use App\Http\Controllers\Api\PharmacyIssueController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->middleware(['auth:sanctum'])->group(function () {
    Route::apiResource('owners', OwnerController::class);
    Route::apiResource('pets', PetController::class);
    Route::apiResource('consultations', ConsultationController::class)->only(['store']);

    Route::post('pharmacy/issues', [PharmacyIssueController::class, 'store']);
    Route::post('admissions/{admission}/discharge', [AdmissionController::class, 'discharge']);
    Route::post('invoices/{invoice}/payments', [InvoiceController::class, 'recordPayment']);
});
