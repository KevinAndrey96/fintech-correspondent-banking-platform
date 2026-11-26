<?php

namespace App\Http\Controllers\Permissions;

use App\Http\Controllers\Controller;
use App\Repositories\Contracts\Permissions\PermissionRepositoryInterface;

class GetAllPermissionsController extends Controller
{
    private PermissionRepositoryInterface $permissionRepository;

    public function __construct(PermissionRepositoryInterface $permissionRepository)
    {
        $this->permissionRepository = $permissionRepository;
    }

    public function __invoke()
    {
        $permissions = $this->permissionRepository->getAll();

        return datatables()->collection($permissions)->toJson();
    }
}
