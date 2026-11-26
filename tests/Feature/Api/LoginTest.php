<?php

namespace Tests\Feature\Api;

use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Symfony\Component\HttpFoundation\Response;
use Tests\TestCase;

class LoginTest extends TestCase
{
    use DatabaseTransactions;

    private const LOGIN_URL = 'api/v1/user/login';

    public function test_developer_receives_an_access_token(): void
    {
        $user = User::factory()->developer()->create();

        $this->postJson(self::LOGIN_URL, ['email' => $user->email, 'password' => 'password'])
            ->assertOk()
            ->assertJson(['message' => 'Success Login'])
            ->assertJsonStructure(['access_token', 'message']);
    }

    public function test_wrong_password_is_rejected(): void
    {
        $user = User::factory()->developer()->create();

        $this->postJson(self::LOGIN_URL, ['email' => $user->email, 'password' => 'wrong-password'])
            ->assertStatus(Response::HTTP_BAD_REQUEST)
            ->assertExactJson(['message' => 'Invalid Credentials']);
    }

    public function test_user_without_developer_mode_is_forbidden(): void
    {
        $user = User::factory()->create();

        $this->postJson(self::LOGIN_URL, ['email' => $user->email, 'password' => 'password'])
            ->assertForbidden()
            ->assertExactJson(['message' => 'Forbidden Access']);
    }

    public function test_extra_fields_do_not_reach_the_credentials_query(): void
    {
        $user = User::factory()->developer()->create();

        $this->postJson(self::LOGIN_URL, [
            'email' => $user->email,
            'password' => 'password',
            'role' => 'Administrator',
        ])->assertOk();
    }

    public function test_email_and_password_are_required(): void
    {
        $this->postJson(self::LOGIN_URL, [])
            ->assertUnprocessable()
            ->assertJsonValidationErrors(['email', 'password']);
    }
}
