<?php

namespace App\Console\Commands;

use App\Models\SupplierProduct;
use App\Models\User;
use Illuminate\Console\Command;

class DeleteProductAssigns extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'product:delete';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
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
