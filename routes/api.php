<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// 接管路由
$api = app('Dingo\Api\Routing\Router');
$api->version('v1', function ($api) {
    $api->group(['namespace' => 'App\Http\Controllers\Api'], function ($api) {
        $api->post('test', 'TestController@index');
        $api->post('make', 'TestController@makeJwt');
        $api->group(['middleware' => 'jwt.api.auth'], function ($api) {
            $api->post('testjwt', 'TestController@testJwt');
        });
    });
});