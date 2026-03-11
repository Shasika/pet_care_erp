<?php

namespace App\Services\Inventory;

class StockMovementService
{
    public function movementPayload(int $medicineId, ?int $batchId, string $type, int $quantity, string $referenceType, int $referenceId): array
    {
        return [
            'medicine_id' => $medicineId,
            'batch_id' => $batchId,
            'movement_type' => $type,
            'quantity' => $quantity,
            'reference_type' => $referenceType,
            'reference_id' => $referenceId,
        ];
    }
}
