<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class WebAuthTest extends TestCase
{
    use DatabaseTransactions;

    public function test_login_page_renders(): void
    {
        $this->get('/')->assertOk()->assertSee('name="email"', false);
        $this->get('/login')->assertOk();
    }

    public function test_guests_are_sent_to_the_login_page(): void
    {
        foreach (['/home', '/products', '/products/create'] as $path) {
            $this->get($path)->assertRedirect('/login');
        }
    }

    public function test_public_registration_is_disabled(): void
    {
        $this->get('/register')->assertNotFound();
        $this->post('/register')->assertNotFound();
    }
}
