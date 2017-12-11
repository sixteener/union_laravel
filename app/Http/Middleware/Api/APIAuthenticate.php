<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/11
 * Time: 15:17
 */
namespace App\Http\Middleware\Api;

use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;

class APIAuthenticate extends BaseMiddleware
{
    /**
     * Handle an incoming request.
     *
     *
     *
     * @version 1.1.0
     * @param   \Illuminate\Http\Request  $request
     * @param   \Closure  $next
     * @return  mixed
     */
    public function handle($request, \Closure $next)
    {
        $jwtAuth = $this->auth->setRequest($request);
        $token = $jwtAuth->getToken();
        try {
            if (! $user = JWTAuth::toUser($token)) {
                return response()->json(['code'=>404, 'msg' => '用户未找到'],404);
            }
        } catch (TokenExpiredException $e) {
            // token 过期
            return response()->json(['code'=>403,'msg' => '令牌过期',],403);
        } catch (TokenInvalidException $e) {
            // token 无效
            return response()->json(['code'=>403,'msg' => '令牌无效',],403);
        } catch (JWTException $e) {
            // token 缺失
            return response()->json(['code'=>404,'msg' => '令牌缺失',],404);
        }
        return $next($request);
    }

}