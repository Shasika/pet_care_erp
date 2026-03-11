<?php

namespace App\Http\Requests\Billing;

use Illuminate\Foundation\Http\FormRequest;

class RecordPaymentRequest extends FormRequest
{
    public function authorize(): bool
    {
        return $this->user()?->can('billing.collect_payment') ?? false;
    }

    public function rules(): array
    {
        return [
            'invoice_id' => ['required', 'integer'],
            'balance' => ['required', 'numeric', 'min:0'],
            'amount' => ['required', 'numeric', 'min:0.01'],
            'method' => ['required', 'string', 'max:60'],
            'reference_no' => ['nullable', 'string', 'max:120'],
        ];
    }
}
