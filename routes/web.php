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
$router->get('/tipe-rumah/{id}', 'TipeRumahController@getTipeRumahById');

$router->get('/perumahan/{tipePerumahanId}', 'PerumahanController@getPerumahanById');

//endregion
//region User



//endregion
//region CalonPemilik

$router->post('/calon-pemilik', 'CalonPemilikController@insertCalonPemilik');
$router->get('/calon-pemilik/{id}', 'CalonPemilikController@getCalonPemilik');
$router->get('/calon-pemilik-all', 'CalonPemilikController@getCalonPemilikAll');
$router->get('/calon-pemilik-all/{id}', 'CalonPemilikController@getCalonPemilikAllById');
$router->patch('/update-status-calon-pemilik/{id}', 'CalonPemilikController@updateStatusCalonPemilik');

//endregion
$router->get('/status-pengajuan-all', 'StatusPengajuanController@getStatusPengajuanAll');
$router->get('/status-pengajuan/{id}', 'StatusPengajuanController@getStatusPengajuanById');
