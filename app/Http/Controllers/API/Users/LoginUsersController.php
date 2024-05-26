<?php

namespace App\Http\Controllers\API\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

/**
 * @OA\Info(
 *             title="User Login",
 *             version="1.0",
 *             description="Here is endpoint to login user"
 * )
 *
 * @OA\Server(url="http://127.0.0.1:8000")
 */
class LoginUsersController extends Controller
{
    /**
     * User Login
     * @OA\Post (
     *     path="/api/v1/user/login",
     *     tags={"Login"},
     *     @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              type="object",
     *              @OA\Property(property="email", type="string"),
     *              @OA\Property(property="password", type="string")
     *          )
     *      ),
     *     @OA\Response(
     *         response=200,
     *         description="Success Login",
     *         @OA\JsonContent(
     *             @OA\Property(
     *                  property="message",
     *                  type="string",
     *                  example="Success Login"
     *              ),
     *              @OA\Property(
     *                   property="access_token",
     *                   type="string",
     *                   example="***REMOVED***"
     *              )
     *           )
     *        ),
     *     @OA\Response(
     *          response=400,
     *          description="Bad Request",
     *          @OA\JsonContent(
     *              @OA\Property(
     *                   property="message",
     *                   type="string",
     *                   example="Invalid Credentials"
     *               ),
     *            )
     *         ),
     *     @OA\Response(
     *           response=403,
     *           description="Forbidden Access",
     *           @OA\JsonContent(
     *               @OA\Property(
     *                    property="message",
     *                    type="string",
     *                    example="Forbidden Access"
     *                ),
     *             )
     *          )
     *     )
     *
     */

    public function __invoke(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'email|required',
            'password' => 'required'
        ]);

        if (! auth()->attempt($loginData)) {
            return response(['message' => 'Invalid Credentials'], 400);
        }

        if (auth()->user()->developer_mode != 1) {
            return response(['message' => 'Forbidden Access'], 403);
        }

        $accessToken = auth()->user()->createToken('authToken')->accessToken;

        return response([
            'message' => 'Success Login',
            'access_token' => $accessToken
        ], 200);
    }
}
