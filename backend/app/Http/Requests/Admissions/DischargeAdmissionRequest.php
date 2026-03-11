<?php

namespace App\Http\Requests\Admissions;

use Illuminate\Foundation\Http\FormRequest;

class DischargeAdmissionRequest extends FormRequest
{
    public function authorize(): bool
    {
        return $this->user()?->can('admissions.discharge') ?? false;
    }

    public function rules(): array
    {
        return [
            'summary' => ['required', 'string'],
            'instructions' => ['nullable', 'string'],
            'follow_up_date' => ['nullable', 'date'],
        ];
    }
}
