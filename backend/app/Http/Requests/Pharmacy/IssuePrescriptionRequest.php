<?php

namespace App\Http\Requests\Pharmacy;

use Illuminate\Foundation\Http\FormRequest;

class IssuePrescriptionRequest extends FormRequest
{
    public function authorize(): bool
    {
        return $this->user()?->can('pharmacy.issue') ?? false;
    }

    public function rules(): array
    {
        return [
            'prescription_id' => ['required', 'integer'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.medicine_batch_id' => ['required', 'integer'],
            'items.*.quantity' => ['required', 'integer', 'min:1'],
        ];
    }
}
