<?php

use App\Services\BillingService;

it('marks invoice paid when payment clears balance', function () {
    $service = new BillingService();
    $updated = $service->applyPayment(['balance' => 120], 120);

    expect($updated['balance'])->toBe(0.0)
        ->and($updated['status'])->toBe('paid');
});
