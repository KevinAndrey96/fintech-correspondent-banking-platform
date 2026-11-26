<?php

namespace Database\Seeders;

use App\Models\SupplierProduct;
use App\Models\User;
use Illuminate\Database\Seeder;

class DeleteProductAssignments extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = User::where('role', 'Distributor')
            ->orWhere('role', 'Shopkeeper')
            ->get();

        foreach ($users as $user) {
            $userProducts = SupplierProduct::where('user_id', $user->id)->get();

            foreach ($userProducts as $userProduct) {
                $userProduct->delete();
            }
        }
    }
}
