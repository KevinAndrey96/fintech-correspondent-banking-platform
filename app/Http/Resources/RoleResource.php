<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @property mixed $id
 * @property mixed $name
 * @property mixed $permissions
 */
class RoleResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     */
    public function toArray($request): array|\JsonSerializable|\Illuminate\Contracts\Support\Arrayable
    {
        return [
            'type' => 'roles',
            'attributes' => [
                'id' => $this->id,
                'name' => $this->name,
            ],
            'relationships' => [
                'permissions' => [
                    'data' => $this->permissions->pluck('id')->toArray(),
                ],
            ],
        ];

    }
}
