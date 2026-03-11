<?php

namespace App\Services\Consultations;

use Illuminate\Support\Facades\DB;

class ConsultationService
{
    public function create(array $data): array
    {
        return DB::transaction(function () use ($data) {
            return [
                'id' => 1,
                'visit_id' => $data['visit_id'],
                'status' => $data['status'],
            ];
        });
    }
}
