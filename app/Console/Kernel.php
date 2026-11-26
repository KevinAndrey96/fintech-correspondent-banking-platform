<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        // date_default_timezone_set('America/Bogota');
        $schedule->command('transaction:reassign')
            ->everyMinute()
            ->timezone('America/Bogota')
            ->emailOutputTo(config('mail.reports_to'), true);
        $schedule->command('mail:supplier-inactivity')
            ->dailyAt('14:00')
            ->timezone('America/Bogota')
            ->emailOutputTo(config('mail.reports_to'), true);
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
