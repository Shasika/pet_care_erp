<?php

namespace App\Services;

class PharmacyService
{
    public function validateIssue(array $batch, int $quantity): void
    {
        if ($quantity <= 0) {
            throw new \InvalidArgumentException('Quantity must be positive.');
        }

        if ($batch['quantity'] < $quantity) {
            throw new \InvalidArgumentException('Insufficient stock for selected batch.');
        }
    }
}
