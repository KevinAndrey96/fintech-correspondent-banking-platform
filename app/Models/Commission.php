<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
use App\Models\User;

/**
 * @property mixed $product_id
 * @property mixed $amount
 * @property mixed $user_id
 * @method static where(string $string)
 */
class Commission extends Model
{
    use HasFactory;

    protected $fillable = [
        'amount',
        'product_id',
        'user_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

}
