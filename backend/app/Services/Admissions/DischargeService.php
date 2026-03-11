<?php

namespace App\Services\Admissions;

use Illuminate\Support\Facades\DB;

class DischargeService
{
    public function discharge(array $admission, array $payload): array
    {
        return DB::transaction(function () use ($admission, $payload) {
            return [
                'admission_id' => $admission['id'],
                'status' => 'discharged',
                'summary' => $payload['summary'],
            ];
        });
    }
}
