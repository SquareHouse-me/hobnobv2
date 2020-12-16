<?php

use Illuminate\Support\Facades\Route;

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
Route::get('/reset_password/{email}/{token}', 'App\Http\Controllers\API\AppUserController@getResetPasswordForm');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    Route::get('business-owner', 'TCG\Voyager\Http\Controllers\VoyagerUserController@businessOwner')->name('voyager.business.owner');
    Route::get('/create_business_owner', 'TCG\Voyager\Http\Controllers\VoyagerUserController@createBusinessOwner')->name('voyager.users.business.create');
    Route::post('/store_business_owner', 'TCG\Voyager\Http\Controllers\VoyagerUserController@storeBusinessOwner')->name('voyager.users.business.store');
    Route::get('/users/{id}/edit/business_owner', 'TCG\Voyager\Http\Controllers\VoyagerUserController@editBusinessOwner')->name('voyager.users.business.edit');
    Route::put('/business_owner/{id}/update', 'TCG\Voyager\Http\Controllers\VoyagerUserController@updateBusinessOwner')->name('voyager.users.business.update');

    Route::get('/assign_chat_room/{id}', 'TCG\Voyager\Http\Controllers\VoyagerUserController@assignChatRoom')->name('voyager.assign.chat.room');
    Route::post('/store_assign_chat_room', 'TCG\Voyager\Http\Controllers\VoyagerUserController@storeAssignChatRoom')->name('voyager.store.assign.chat.room');

    Route::get('/chat-rooms', 'TCG\Voyager\Http\Controllers\VoyagerUserController@chatRoom')->name('voyager.chat-rooms.index');

    Route::get('/chat-offers/{id}', 'TCG\Voyager\Http\Controllers\VoyagerUserController@chatOffer')->name('voyager.chat-offers.index');
    Route::get('/add-new-chat-offers/{id}', 'TCG\Voyager\Http\Controllers\VoyagerUserController@addChatOffer')->name('voyager.add-new-chat-offers');
    Route::post('/store-add-new-chat-offers', 'TCG\Voyager\Http\Controllers\VoyagerUserController@storeChatOffer')->name('voyager.store-new-chat-offers');
    Route::get('/edit-new-chat-offers/{id}', 'TCG\Voyager\Http\Controllers\VoyagerUserController@editChatOffer')->name('voyager.edit-new-chat-offers');
    Route::post('/update-add-new-chat-offers', 'TCG\Voyager\Http\Controllers\VoyagerUserController@updateChatOffer')->name('voyager.update-new-chat-offers');
    Route::get('/read-new-chat-offers/{id}', 'TCG\Voyager\Http\Controllers\VoyagerUserController@readChatOffer')->name('voyager.read-new-chat-offers');

    //for business owner
    Route::get('/edit-approval-chat-room/{id}', 'TCG\Voyager\Http\Controllers\VoyagerUserController@editApprovalChatRoom')->name('voyager.edit-approval-chat-room');
    Route::post('/update-approval-chat-room', 'TCG\Voyager\Http\Controllers\VoyagerUserController@updateApprovalChatRoom')->name('voyager.update-approval-chat-room');

    //for super admin
    Route::get('/approval-chat-room/{id}', 'TCG\Voyager\Http\Controllers\VoyagerUserController@approvalChatRoom')->name('voyager.approval-chat-room');
    Route::post('/edit-approval-chat-room', 'TCG\Voyager\Http\Controllers\VoyagerUserController@approvalRequestChatRoom')->name('voyager.request-approval-chat-room');
    Route::get('/verification/{id}', 'TCG\Voyager\Http\Controllers\VerificationController@appUserVerification')->name('verification');
    Route::get('/status/{id}', 'TCG\Voyager\Http\Controllers\VerificationController@appUserStatus')->name('status');
    Route::get('/contact-status/{id}', 'TCG\Voyager\Http\Controllers\VerificationController@contactStatus')->name('contact-status');
    Route::get('/archive-status/{id}', 'TCG\Voyager\Http\Controllers\VerificationController@archiveStatus')->name('archive-status');
    Route::get('send_notification/{id}', 'TCG\Voyager\Http\Controllers\NotificationController@sendNotification')->name('send_notification');

});

Route::get('setlocale/{locale}', function ($locale) {
    if (in_array($locale, \Config::get('app.locales'))) {
        session(['locale' => $locale]);
    }
    return redirect()->back();
});
