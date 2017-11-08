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

Route::resource('members', 'MemberController');
Route::resource('articles', 'ArticleController');
//Route::resource('members', 'memberController');
//Route::controller('members', 'MemberController');
Route::post('members/login', 'MemberController@login');
Route::get('get-articles', 'ArticleController@getArticles');
Route::get('get-create', 'ArticleController@createpost');
Route::get('get-articles-by-search', 'ArticleController@getArticlesForSearch');
Route::get('get-articles-for-user', 'ArticleController@getArticlesForUser');
Route::post('mina', 'ArticlesController@mina');
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
