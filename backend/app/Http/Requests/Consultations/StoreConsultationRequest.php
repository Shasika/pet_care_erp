<?php

namespace App\Http\Requests\Consultations;

use Illuminate\Foundation\Http\FormRequest;

class StoreConsultationRequest extends FormRequest
{
    public function authorize(): bool
    {
        return $this->user()?->can('consultations.create') ?? false;
    }

    public function rules(): array
    {
        return [
            'visit_id' => ['required', 'integer'],
            'symptoms' => ['nullable', 'string'],
            'diagnosis' => ['nullable', 'string'],
            'treatment_notes' => ['nullable', 'string'],
            'status' => ['required', 'in:draft,finalized'],
        ];
    }
}
