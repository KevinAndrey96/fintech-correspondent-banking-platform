<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Country deployment
    |--------------------------------------------------------------------------
    |
    | The same code base runs one instance per country. These values select
    | the country rules (limits, remittances) and the labels shown in the UI.
    |
    */

    'country_name' => env('COUNTRY_NAME', 'COLOMBIA'),

    'country_code' => env('COUNTRY_CODE', '57'),

    'rut_name' => env('RUT_NAME', 'RUT'),

    'load_background' => env('LOAD_BACKGROUND', '/assets/img/load-colombia.jpeg'),

    'environment' => env('PROJECT_ENVIRONMENT', 'local'),

    'uploader_url' => env('URL_UPLOADER'),

];
