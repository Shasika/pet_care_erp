<?php

namespace App\Services;

class BillingService
{
    public function applyPayment(array $invoice, float $amount): array
    {
        $invoice['balance'] = max(0, $invoice['balance'] - $amount);
        $invoice['status'] = $invoice['balance'] == 0 ? 'paid' : 'partial';

        return $invoice;
    }
}
