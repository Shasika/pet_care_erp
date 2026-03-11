<?php

namespace App\Policies;

use App\Models\User;

class ModulePolicy
{
    public function access(User $user, string $permission): bool
    {
        return $user->can($permission);
    }
}
