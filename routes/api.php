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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', 'App\Http\Controllers\API\AppUserController@login');
Route::post('register', 'App\Http\Controllers\API\AppUserController@register');
Route::post('verify', 'App\Http\Controllers\API\AppUserController@verify');
Route::post('forgot_password', 'App\Http\Controllers\API\AppUserController@forgotPassword');
Route::post('reset_password', 'App\Http\Controllers\API\AppUserController@resetPassword');


Route::group(['middleware' => 'auth:api'], function () {
    Route::post('change_password', 'App\Http\Controllers\API\AppUserController@changePassword');
    Route::post('about_us', 'App\Http\Controllers\API\AboutUsController@aboutUs');
    Route::post('privacy_policy', 'App\Http\Controllers\API\PrivacyPolicyController@privacyPolicy');
    Route::post('terms_and_condition', 'App\Http\Controllers\API\TermsAndConditionController@termsAndCondition');
    Route::post('contact_us', 'App\Http\Controllers\API\ContactUsController@contactUs');
    Route::post('gender', 'App\Http\Controllers\API\AppUserController@gender');
    Route::post('lat_long', 'App\Http\Controllers\API\AppUserController@latLong');
    Route::post('updateuser', 'App\Http\Controllers\API\AppUserController@updateuser');
    Route::get('socialmedia', 'App\Http\Controllers\API\AppUserController@socialmedia');
    Route::post('chatroomsoffers','App\Http\Controllers\API\AppUserController@chatroomsoffers');
    Route::post('Reportinguser', 'App\Http\Controllers\API\AppUserController@Reportinguser');
    Route::post('Chatrooms',   'App\Http\Controllers\API\AppUserController@Chatrooms');
    Route::post('assignchatrooms','App\Http\Controllers\API\AppUserController@assignchatrooms');
    Route::post('ChatDeals',   'App\Http\Controllers\API\AppUserController@ChatDeals');
    Route::post('Chatgroups', 'App\Http\Controllers\API\AppUserController@Chatgroups');
    Route::post('ChatGroupUsers', 'App\Http\Controllers\API\AppUserController@ChatGroupUsers');
    Route::post('ChatMessages', 'App\Http\Controllers\API\AppUserController@ChatMessages');
    Route::post('Usermessages', 'App\Http\Controllers\API\AppUserController@Usermessages');
    Route::post('ChatRating', 'App\Http\Controllers\API\AppUserController@ChatRating');
    Route::post('favoriteChatRoom', 'App\Http\Controllers\API\AppUserController@favoriteChatRoom');
    Route::post('GetChatRooms', 'App\Http\Controllers\API\AppUserController@GetChatRooms');
    Route::post('GetChatDeals', 'App\Http\Controllers\API\AppUserController@GetChatDeals');
    Route::post('Getfavoritechatrooms', 'App\Http\Controllers\API\AppUserController@Getfavoritechatrooms');
    Route::post('Getreportingusers', 'App\Http\Controllers\API\AppUserController@Getreportingusers');
 
});
