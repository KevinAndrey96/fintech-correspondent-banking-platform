<?php

namespace App\UseCases\Contracts\Roles;

interface GetRoleIDsPermissionIDsUseCaseInterface
{
    public function getRoleIDsPermissionIDs($roleHasPermissionsCollection);
}
