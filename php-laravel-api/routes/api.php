<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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
// api routes that need auth

Route::middleware(['auth:api'])->group(function () {
	

/* routes for Questions Controller  */	
	Route::get('questions', 'QuestionsController@index');
	Route::get('questions/index', 'QuestionsController@index');
	Route::get('questions/index/{filter?}/{filtervalue?}', 'QuestionsController@index');	
	Route::get('questions/view/{rec_id}', 'QuestionsController@view');	
	Route::post('questions/add', 'QuestionsController@add');	
	Route::any('questions/edit/{rec_id}', 'QuestionsController@edit');	
	Route::any('questions/delete/{rec_id}', 'QuestionsController@delete');	
	Route::get('questions/quiz', 'QuestionsController@quiz');
	Route::get('questions/quiz/{filter?}/{filtervalue?}', 'QuestionsController@quiz');	
	Route::get('questions/major', 'QuestionsController@major');
	Route::get('questions/major/{filter?}/{filtervalue?}', 'QuestionsController@major');	
	Route::post('questions/attempt', 'QuestionsController@attempt');	
	Route::get('questions/manage_leaderboard', 'QuestionsController@manage_leaderboard');
	Route::get('questions/manage_leaderboard/{filter?}/{filtervalue?}', 'QuestionsController@manage_leaderboard');

/* routes for Leaderboard Controller  */	
	Route::get('leaderboard', 'LeaderboardController@index');
	Route::get('leaderboard/index', 'LeaderboardController@index');
	Route::get('leaderboard/index/{filter?}/{filtervalue?}', 'LeaderboardController@index');	
	Route::get('leaderboard/view/{rec_id}', 'LeaderboardController@view');	
	Route::post('leaderboard/add', 'LeaderboardController@add');	
	Route::any('leaderboard/edit/{rec_id}', 'LeaderboardController@edit');	
	Route::any('leaderboard/delete/{rec_id}', 'LeaderboardController@delete');

/* routes for Users Controller  */	
	Route::get('users', 'UsersController@index');
	Route::get('users/index', 'UsersController@index');
	Route::get('users/index/{filter?}/{filtervalue?}', 'UsersController@index');	
	Route::get('users/view/{rec_id}', 'UsersController@view');	
	Route::any('account/edit', 'AccountController@edit');	
	Route::get('account', 'AccountController@index');	
	Route::post('account/changepassword', 'AccountController@changepassword');	
	Route::get('account/currentuserdata', 'AccountController@currentuserdata');	
	Route::post('users/add', 'UsersController@add');	
	Route::any('users/edit/{rec_id}', 'UsersController@edit');	
	Route::any('users/delete/{rec_id}', 'UsersController@delete');

/* routes for Mainhome Controller  */	
	Route::get('mainhome', 'MainhomeController@index');
	Route::get('mainhome/index', 'MainhomeController@index');
	Route::get('mainhome/index/{filter?}/{filtervalue?}', 'MainhomeController@index');	
	Route::get('mainhome/view/{rec_id}', 'MainhomeController@view');	
	Route::post('mainhome/add', 'MainhomeController@add');	
	Route::any('mainhome/edit/{rec_id}', 'MainhomeController@edit');	
	Route::any('mainhome/delete/{rec_id}', 'MainhomeController@delete');

/* routes for Test Controller  */	
	Route::get('test', 'TestController@index');
	Route::get('test/index', 'TestController@index');
	Route::get('test/index/{filter?}/{filtervalue?}', 'TestController@index');	
	Route::get('test/view/{rec_id}', 'TestController@view');	
	Route::post('test/add', 'TestController@add');	
	Route::any('test/edit/{rec_id}', 'TestController@edit');	
	Route::any('test/delete/{rec_id}', 'TestController@delete');
});

	
	Route::post('auth/register', 'AuthController@register');	
	Route::post('auth/login', 'AuthController@login');	
	Route::post('auth/forgotpassword', 'AuthController@forgotpassword')->name('password.reset');	
	Route::post('auth/resetpassword', 'AuthController@resetpassword');
	
Route::get('components_data/users_username_exist/{arg1?}', 'Components_dataController@users_username_exist');	
Route::get('components_data/users_email_exist/{arg1?}', 'Components_dataController@users_email_exist');	
Route::get('components_data/post_option_list/{arg1?}', 'Components_dataController@post_option_list');

Route::post('fileuploader/upload/{fieldname}', 'FileUploaderController@upload');
Route::post('fileuploader/remove_temp_file', 'FileUploaderController@remove_temp_file');