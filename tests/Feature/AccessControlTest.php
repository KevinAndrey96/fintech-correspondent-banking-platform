<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\PermissionRegistrar;
use Tests\TestCase;

class AccessControlTest extends TestCase
{
    use DatabaseTransactions;

    public function test_administrative_pages_require_a_session(): void
    {
        foreach (['/banners', '/brands', '/exchanges', '/platform-lock-index', '/roles', '/permissions', '/transaction/cancel/1'] as $uri) {
            $this->get($uri)->assertRedirect('/login');
        }
    }

    public function test_state_changing_actions_require_a_session(): void
    {
        foreach (['/platform-lock', '/change-authorized-user', '/exchanges-update', '/brands-store'] as $uri) {
            $this->post($uri)->assertRedirect('/login');
        }
    }

    public function test_dashboard_ajax_endpoints_are_not_public(): void
    {
        $this->postJson('/api/save-role-assignments')->assertUnauthorized();
        $this->postJson('/api/role-store')->assertUnauthorized();
        $this->postJson('/api/get-statistics-data')->assertUnauthorized();
        $this->getJson('/api/get-all-roles')->assertUnauthorized();
        $this->getJson('/api/getStatus/1')->assertUnauthorized();
    }

    public function test_configuration_requires_the_matching_permission(): void
    {
        $shopkeeper = User::factory()->create();

        $this->actingAs($shopkeeper)->get('/banners')->assertForbidden();
        $this->actingAs($shopkeeper)->post('/platform-lock')->assertForbidden();
        $this->actingAs($shopkeeper)->getJson('/api/get-all-roles')->assertForbidden();
    }

    public function test_roles_endpoint_is_available_with_permission(): void
    {
        app(PermissionRegistrar::class)->forgetCachedPermissions();
        Permission::findOrCreate('Ver roles y permisos', 'web');
        $admin = User::factory()->create(['role' => 'Administrator']);
        $admin->givePermissionTo('Ver roles y permisos');

        $this->actingAs($admin)->getJson('/api/get-all-roles')->assertOk();
    }

    public function test_transaction_status_is_only_visible_to_its_participants(): void
    {
        $distributor = User::factory()->create(['role' => 'Distributor']);
        $shopkeeper = User::factory()->create();
        $stranger = User::factory()->create();

        $transactionId = DB::table('transactions')->insertGetId([
            'shopkeeper_id' => $shopkeeper->id,
            'distributor_id' => $distributor->id,
            'amount' => 50000,
            'type' => 'Deposit',
            'status' => 'hold',
            'date' => '2024-01-15',
            'created_at' => '2024-01-15 10:00:00',
            'updated_at' => '2024-01-15 10:00:00',
        ]);

        $this->actingAs($shopkeeper)->getJson("/api/getStatus/{$transactionId}")
            ->assertOk()
            ->assertJsonPath('status', 'hold');

        $this->actingAs($stranger)->getJson("/api/getStatus/{$transactionId}")->assertNotFound();
    }
}
