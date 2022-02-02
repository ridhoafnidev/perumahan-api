<?php

/** @var \Laravel\Lumen\Routing\Router $router */

$router->get('/', function () use ($router) {
    return $router->app->version();
});

//region Register

$router->post('/register', 'UserController@register');

//endregion
//region Login

$router->post('/login', 'UserController@login');

//endregion
//region Tipe Rumah

$router->get('/tipe-rumah-all', 'TipeRumahController@getTipeRumahAll');
$router->get('/tipe-rumah-by-id', 'TipeRumahController@getTipeRumahById');

//endregion
//region User

//TODO

//endregion
//region CalonPemilik

//TODO

//endregion
