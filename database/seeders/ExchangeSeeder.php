<?php

namespace Database\Seeders;

use App\Models\Exchange;
use Illuminate\Database\Seeder;

class ExchangeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $exchange = new Exchange;
        $exchange->badge = 'Pesos colombianos';
        $exchange->value = 4000;
        $exchange->save();
    }
}
