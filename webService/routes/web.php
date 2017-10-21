<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resource('members', 'MemberController');
//Route::controller('members', 'MemberController');
//
//Route::get('/mm', function () {
//    return "aaaaA";
//    return view('welcome');
//});


//Route::get('/mina', 'MemberController@index');
Route::get('/home', 'HomeController@index')->name('home');
Auth::routes();
