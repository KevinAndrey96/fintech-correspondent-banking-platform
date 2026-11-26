<?php

namespace Database\Seeders;

use App\Models\TransactionField;
use Illuminate\Database\Seeder;

class TransactionFieldsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $transactionFields = new TransactionField;
        $transactionFields->document = 'Documento:';
        $transactionFields->document_type = 'Tipo de documento:';
        $transactionFields->email = 'Correo:';
        $transactionFields->first_code = 'Código';
        $transactionFields->second_code = 'Segundo código';
        $transactionFields->client_name = 'Nombre del cliente';
        $transactionFields->save();
    }
}
