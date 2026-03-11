<?php

namespace App\Support;

class ApiResponse
{
    public static function success($data = null, string $message = 'OK', array $meta = []): array
    {
        return ['success' => true, 'message' => $message, 'data' => $data, 'meta' => $meta];
    }
}
