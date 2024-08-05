<?php

namespace App\Http\Controllers\API\Users;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginUserDataRequest;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * @OA\Info(
 *             title="Asparecargas Endpoints",
 *             version="1.0",
 *             description="Here are the endpoints of Asparecargas"
 * )
 *
 * @OA\Server(url="https://testing.asparecargas.net")
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

    public function __invoke(LoginUserDataRequest $request)
    {
        $loginData = $request->all();

        if (! auth()->attempt($loginData)) {
            return response(['message' => 'Invalid Credentials'], 400);
        }

        if (auth()->user()->developer_mode != 1) {
            return response(['message' => 'Forbidden Access'], Response::HTTP_FORBIDDEN);
        }

        $accessToken = auth()->user()->createToken('authToken')->accessToken;

        return response([
            'message' => 'Success Login',
            'access_token' => $accessToken
        ], 200);
    }
}
