<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/11
 * Time: 14:38
 */
namespace App\Http\Controllers\Api;


use App\Models\Unionuser;
use Dingo\Api\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\User;
use Dingo\Api\Exception\StoreResourceFailedException;
use Dingo\Api\Routing\Helpers;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Validator;
use JWTAuth;

class TestController extends BaseController
{
    public function index(Request $request)
    {
        $data = ['123'=>123,'request'=>$request['abc']];
        return $data;
    }
    public function makeJwt(Request $request)
    {
        $data = Unionuser::where('username', $request['username'])->first();
        try {
            // 尝试验证凭据并为用户创建令牌
            $token = JWTAuth::fromUser($data);
            if (! isset($token)) {
                return response()->json(
                    [
                        'message' => '令牌无效',
                        'status_code' => 401
                    ]
                );
            }
        } catch (JWTException $e) {
            // 尝试编码令牌时发生错误
            return response()->json(
                [
                    'message' => '令牌创建失败',
                    'status_code' => 500
                ]
            );
        }
        return ['code'=>0 ,'data'=>$token];

    }
    public function testJwt(Request $request)
    {
        $user = $this->checkToken($request['token']);
        return ['code'=>0 ,'data'=>$user];

    }
    // 检测用户输入的 token 是否合法
    public function checkToken($token)
    {
        try {
            if (! $user = JWTAuth::toUser($token)) {
                dd($user);
                return $this->response->error('用户未找到', 404);
            }
        } catch (TokenExpiredException $e) {
            // token 过期
            return response()->json(
                [
                    'message' => '令牌过期',
                    'status_code' => $e->getStatusCode()
                ], $e->getStatusCode()
            );
        } catch (TokenInvalidException $e) {
            // token 无效
            return response()->json(
                [
                    'message' => '令牌无效',
                    'status_code' => $e->getStatusCode()
                ], $e->getStatusCode()
            );
        } catch (JWTException $e) {
            // token 缺失
            return response()->json(
                [
                    'message' => '令牌缺失',
                    'status_code' => $e->getStatusCode()
                ], $e->getStatusCode()
            );
        }
        return $user;
    }
}