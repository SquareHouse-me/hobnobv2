<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\API\AppUser;
use App\Models\API\SocialMedia;
use App\Models\API\ChatRoomOffers;
use App\Models\API\ReportingUsers;
use App\Models\API\ChatRooms;
use App\Models\API\AssignChatRoom;
use App\Models\API\Deals;
use App\Models\API\Groups;
use App\Models\API\GroupUsers;
use App\Models\API\Messages;
use App\Models\API\UserMessages;
use App\Models\API\Rating;
use App\Models\API\DeviceToken;
use \App\Models\API\FavoriteChatRoom;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AppUserController extends Controller
{
    public $successStatus = 200;
    public $HTTP_FORBIDDEN = 403;
    public $HTTP_NOT_FOUND = 404;

    public function login(Request $request)
    {
        $device_name = $request->device_name;
        $device_token = $request->device_token;

        $array = array();
        if (Auth::guard('app_user')->attempt(['email' => $request->email, 'password' => $request->password])) {
            $app_user = Auth::guard('app_user')->user();
            $array['id'] = $app_user->id;
            $array['username'] = $app_user->username;
            $array['phone'] = $app_user->phone;
            $array['email'] = $app_user->email;
            $array['gender'] = $app_user->gender ?? NULL;
            $array['token'] = $app_user->createToken('MyApp')->accessToken;

            
            $deviceToken = DeviceToken::where('token', $device_token)->first();
            if ($deviceToken == null) {
                $newDeviceToken = new DeviceToken();
                $newDeviceToken->user_id = $app_user->id;
                $newDeviceToken->device  = $device_name;
                $newDeviceToken->token   = $device_token;
                $newDeviceToken->save();
            }

            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => 401, 'message' => 'These credentials does not match our records.', 'data' => []]);
        }
    }

    public function register(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'username' => 'required',
            'dob' => 'required',
            'email' => 'required|email|unique:app_users,email',
            'phone' => 'required|unique:app_users,phone',
            'password' => 'required|string|min:6|regex:/^(?=.*?[#?!@$.%^&*-]).{6,}$/',
            'confirm_password' => 'required|same:password',
        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $code = validateSecurityCode();
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $input['code'] = $code;
        $input['status'] = 'Unactive';
        $input['created_at'] = Carbon::now();
        $input['updated_at'] = Carbon::now();
        $app_user = AppUser::create($input);
        $array['token'] = $app_user->createToken('MyApp')->accessToken;
        $array['code'] = $code;
        $appUser = AppUser::where('id', $app_user->id)->first();
        $array['id'] = $appUser->id;
        $array['username'] = $appUser->username;
        $array['email'] = $appUser->email;
        $array['phone'] = $appUser->phone;
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
    }


    public function verify(Request $request)
    {
        if ($request->input_code == $request->send_code) {
            AppUser::where('id', $request->id)->update([
                'status' => 'Active',
                'code' => null,
                'updated_at' => Carbon::now()
            ]);
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Account verified successfully']);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Please provide correct code to get verified.']);
        }
    }

    public function changePassword(Request $request)
    {
        if (Auth::check()) {
            $hashedPassword = Auth::user()->password;
            if (Hash::check($request->old_password, $hashedPassword)) {
                if (!Hash::check($request->password, $hashedPassword)) {
                    if ($request->password != $request->confirm_password) {
                        return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'New password and confirm password doesnt matched.']);
                    } else {
                        $appUser = AppUser::find($request->user_id);
                        $appUser->password = bcrypt($request->password);
                        AppUser::where('id', $request->user_id)->update(array('password' => $appUser->password));
                        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Password updated successfully.']);
                    }
                } else {
                    return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'New password can not be the old password.']);
                }
            } else {
                return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Old password doesnt matched.']);
            }
        } else {
            return response()->json(['error' => false, 'status' => 401, 'message' => 'Please login to change password.']);
        }
    }

    public function forgotPassword(Request $request)
    {
        $appUser = AppUser::where('email', $request->email)->first();
        if (empty($appUser)) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Please provide correct email.']);
        } else {
            $token = Str::random(64);

            DB::table('password_resets')->insert([
                'email' => $request->email,
                'token' => $token
            ]);
            Mail::send('email.forgot', ['appUser' => $appUser, 'token' => $token], function ($m) use ($appUser) {
                $m->from('abc@gmail.com', 'Hobnob');
                $m->to($appUser->email, $appUser->username)->subject('Reset Password!');
            });
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Please check your email to reset your password.']);
        }
    }

    public function getResetPasswordForm($email, $token)
    {
        return view('email.reset', compact('email', 'token'));
    }

    public function resetPassword(Request $request)
    {
        $request->validate([
            'password' => 'required|string|min:6|confirmed',
        ]);
        $check = DB::table('password_resets')->where('email', $request->email)
            ->where('token', $request->token)->first();
        if (empty($check)) {
            return redirect()->back()->with(['error' => 'Please check your email again to verify your token and email.']);
        } else {
            $password = bcrypt($request->password);
            AppUser::where('email', $request->email)->update(array('password' => $password));
            return redirect()->back()->with(['success' => 'Your password has been updated successfully.']);
        }
    }

    public function gender(Request $request)
    {
        if (Auth::check()) {
            AppUser::where('id', $request->id)->update(array('gender' => $request->gender));
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Your gender has been updated successfully.']);
        } else {
            return response()->json(['error' => false, 'status' => 401, 'message' => 'Please login to change gender.']);
        }
    }

    public function latLong(Request $request)
    {
        if (Auth::check()) {
            AppUser::where('id', $request->id)->update(array('lat' => $request->lat, 'long' => $request->long));
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Your location has been updated successfully.']);
        } else {
            return response()->json(['error' => false, 'status' => 401, 'message' => 'Please login to change gender.']);
        }
    }
    public function updateuser(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'username' => 'required',
            'dob' => 'required',
            'email' => 'required|email|unique:app_users,email',
            'phone' => 'required|unique:app_users,phone',
        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        // $code = validateSecurityCode();
        $input = $request->all();

        $app_user = AppUser::find($input['id']);
        $app_user->username = $request->input('username');
        $app_user->dob = $request->input('dob');
        $app_user->email = $request->input('email');
        $app_user->phone = $request->input('phone');
        // $app_user->password=$request->input('password');
        $app_user->gender = $request->input('gender');
        $app_user->lat = $request->input('lat');
        $app_user->long = $request->input('long');
        $app_user['created_at'] = Carbon::now();
        $app_user['updated_at'] = Carbon::now();
        $app_user->status = $request->input('status');
        $app_user->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record Updated.', 'data' => $app_user]);
    }


    public function socialmedia(Request $request)
    {
        $array = array();
        $socialUs = SocialMedia::withTranslation([$request->lang])->get();
        $socialUs = $socialUs->translate($request->lang);
        if (!$socialUs->isEmpty()) {
            foreach ($socialUs as $k => $v) {
                $array[$k]['id '] = $v->id ?? null;
                $array[$k]['facebook'] = $v->facebook ?? null;
                $array[$k]['instagram'] = $v->instagram ?? null;
                $array[$k]['twitter'] = $v->twitter ?? null;
                $array[$k]['created_at'] = $v->created_at ?? null;
                $array[$k]['updated_at'] = $v->updated_at ?? null;
            }
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'No record found.', 'data' => []]);
        }
    }



    public function chatroomsoffers(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'status' => 'required',
            'chat_room_id' => 'required',
            'user_id' => 'required',

        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $chats_off = new ChatRoomOffers();
        // $chats_off->images=$request->input('image');
        $chats_off->status = $request->input('status');
        $chats_off->chat_room_id = $request->input('chat_room_id');
        $chats_off->user_id = $request->input('user_id');
        $chats_off['created_at'] = Carbon::now();
        $chats_off['updated_at'] = Carbon::now();
        if ($file = $request->hasFile('image')) {
            $file = $request->file('image');
            $fileName = $file->getClientOriginalName();
            $destinationPath = public_path() . '/offer_chat/';
            $file->move($destinationPath, $fileName);
            $chats_off->image = '/offer_chat/' . $fileName;
        }

        $chats_off->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $chats_off]);
    }


    public function Reportinguser(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'userid' => 'required',
            'against_id' => 'required',
            'status' => 'required',
            'description' => 'required',

        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $report_user = new ReportingUsers();
        $report_user->userid = $request->input('userid');
        $report_user->against_id = $request->input('against_id');
        // $report_user->complain_number=$request->input('complain_number');
        $report_user->status = $request->input('status');
        $report_user->description = $request->input('description');
        $report_user['created_at'] = Carbon::now();
        $report_user['updated_at'] = Carbon::now();
        $report_user->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $report_user]);
    }




    public function Chatrooms(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'cover_picture' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'information' => 'required',
            'chat_room_type' => 'required',
            'lat' => 'required',
            'long' => 'required',
            'business_type' => 'required',
            'chat_room_area' => 'required',
            'status' => 'required',
            'working_start_hours' => 'required',
            'working_end_hours' => 'required',


        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $chat_room = new ChatRooms();
        $chat_room->name = $request->input('name');
        // $chat_room->logo=$request->input('logo');
        // $chat_room->cover_picture=$request->input('cover_picture');
        $chat_room->information = $request->input('information');
        $chat_room->chat_room_type = $request->input('chat_room_type');
        $chat_room->lat = $request->input('lat');
        $chat_room->long = $request->input('long');
        $chat_room->business_type = $request->input('business_type');
        $chat_room->chat_room_area = $request->input('chat_room_area');
        $chat_room->status = $request->input('status');
        $chat_room->working_start_hours = $request->input('working_start_hours');
        $chat_room->working_end_hours = $request->input('working_end_hours');
        $chat_room['created_at'] = Carbon::now();
        $chat_room['updated_at'] = Carbon::now();

        if ($file = $request->hasFile('logo')) {
            $file = $request->file('logo');
            $fileName = $file->getClientOriginalName();
            $destinationPath = public_path() . '/logo_chat/';
            $file->move($destinationPath, $fileName);
            $chat_room->logo = '/logo_chat/' . $fileName;


            if ($file = $request->file('cover_picture')) {
                $file = $request->file('cover_picture');
                $fileName = $file->getClientOriginalName();
                $destinationPath = public_path() . '/cover_chat/';
                $file->move($destinationPath, $fileName);
                $chat_room->cover_picture = '/cover_chat/' . $fileName;
            }
        }

        $chat_room->save();

        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $chat_room]);
    }





    public function assignchatrooms(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'user_id' => 'required',
            'chat_room_id' => 'required'
        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $assign_chat = new AssignChatRoom();
        $assign_chat->user_id = $request->input('user_id');
        $assign_chat->chat_room_id = $request->input('chat_room_id');
        $assign_chat['created_at'] = Carbon::now();
        $assign_chat['updated_at'] = Carbon::now();
        $assign_chat->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $assign_chat]);
    }


    public function ChatDeals(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'url' => 'required',


        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $deal_chat = new Deals();
        $deal_chat->url = $request->input('url');
        $deal_chat['created_at'] = Carbon::now();
        $deal_chat['updated_at'] = Carbon::now();
        if ($file = $request->hasFile('image')) {
            $file = $request->file('image');
            $fileName = $file->getClientOriginalName();
            $destinationPath = public_path() . '/Dealimages/';
            $file->move($destinationPath, $fileName);
            $deal_chat->image = '/Dealimages/' . $fileName;
        }
        // $deal_chat->image=$request->input('image');
        $deal_chat->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $deal_chat]);
    }


    public function Chatgroups(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',

        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $group_chat = new Groups();
        $group_chat->name = $request->input('name');
        $group_chat['created_at'] = Carbon::now();
        $group_chat['updated_at'] = Carbon::now();
        $group_chat->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $group_chat]);
    }


    public function ChatGroupUsers(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'group_id' => 'required',
            'user_id' => 'required',

        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $groupuser_chat = new GroupUsers();
        $groupuser_chat->group_id = $request->input('group_id');
        $groupuser_chat->user_id = $request->input('user_id');
        $groupuser_chat['created_at'] = Carbon::now();
        $groupuser_chat['updated_at'] = Carbon::now();
        $groupuser_chat->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $groupuser_chat]);
    }


    public function ChatMessages(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'message' => 'required',
            'type' => 'required',
            'status' => 'required',

        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $messageuser_chat = new Messages();
        $messageuser_chat->parent_id = $request->input('parent_id');
        $messageuser_chat->message = $request->input('message');
        // $messageuser_chat->file=$request->input('file');
        $messageuser_chat->type = $request->input('type');
        $messageuser_chat->status = $request->input('status');
        $messageuser_chat['created_at'] = Carbon::now();
        $messageuser_chat['updated_at'] = Carbon::now();
        if ($file = $request->hasFile('file')) {
            $file = $request->file('file');
            $fileName = $file->getClientOriginalName();
            $destinationPath = public_path() . '/messages_chat/';
            $file->move($destinationPath, $fileName);
            $messageuser_chat->file = '/messages_chat/' . $fileName;
        }
        $messageuser_chat->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $messageuser_chat]);
    }


    public  function Usermessages(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'message_id' => 'required',
            'sender_id' => 'required',


        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $usermessage_chat = new UserMessages();
        $usermessage_chat->message_id = $request->input('message_id');
        $usermessage_chat->sender_id = $request->input('sender_id');
        $usermessage_chat->receiver_id = $request->input('receiver_id');
        $usermessage_chat->group_id = $request->input('group_id');
        $usermessage_chat['created_at'] = Carbon::now();
        $usermessage_chat['updated_at'] = Carbon::now();
        $usermessage_chat->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $usermessage_chat]);
    }


    public function ChatRating(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'user_id' => 'required',
            'chatroom_id' => 'required',
            'Rating' => 'required',


        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $chat_rating = new Rating();
        $chat_rating->user_id = $request->input('user_id');
        $chat_rating->chatroom_id = $request->input('chatroom_id');
        $chat_rating->Rating = $request->input('Rating');
        $chat_rating['created_at'] = Carbon::now();
        $chat_rating['updated_at'] = Carbon::now();
        $chat_rating->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $chat_rating]);
    }

    public function favoriteChatRoom(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'userid' => 'required',
            'chatroomid' => 'required',
            'chatroom_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'status' => 'required',




        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $array = array();
        $input = $request->all();
        $fav_chat = new FavoriteChatRoom();
        $fav_chat->userid = $request->input('userid');
        $fav_chat->chatroomid = $request->input('chatroomid');
        $fav_chat->status = $request->input('status');
        $fav_chat->Gender = $request->input('Gender');
        $fav_chat['created_at'] = Carbon::now();
        $fav_chat['updated_at'] = Carbon::now();
        if ($file = $request->hasFile('chatroom_image')) {
            $file = $request->file('chatroom_image');
            $fileName = $file->getClientOriginalName();
            $destinationPath = public_path() . '/favriout_chat/';
            $file->move($destinationPath, $fileName);
            $fav_chat->chatroom_image = '/favriout_chat/' . $fileName;
        }
        $fav_chat->save();
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $fav_chat]);
    }


    public function GetChatRooms(Request $request)
    {
        $array = array();
        $chat_rooms = ChatRooms::withTranslation([$request->lang])->get();
        $chat_rooms = $chat_rooms->translate($request->lang);
        if (!$chat_rooms->isEmpty()) {
            foreach ($chat_rooms as $k => $v) {
                $array[$k]['id '] = $v->id ?? null;
                $array[$k]['name'] = $v->name ?? null;
                $array[$k]['logo'] = $v->logo ?? null;
                $array[$k]['cover_picture'] = $v->cover_picture ?? null;
                $array[$k]['information'] = $v->information ?? null;
                $array[$k]['chat_room_type'] = $v->chat_room_type ?? null;
                $array[$k]['lat'] = $v->lat ?? null;
                $array[$k]['long'] = $v->long ?? null;
                $array[$k]['business_type'] = $v->business_type ?? null;
                $array[$k]['chat_room_area'] = $v->chat_room_area ?? null;
                $array[$k]['status'] = $v->status ?? null;
                $array[$k]['working_start_hours'] = $v->working_start_hours ?? null;
                $array[$k]['working_end_hours'] = $v->working_end_hours ?? null;
                $array[$k]['radius'] = $v->radius ?? null;
                $array[$k]['uuid'] = $v->uuid ?? null;
            }
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'No record found.', 'data' => []]);
        }
    }




    public function GetChatDeals(Request $request)
    {
        $array = array();
        $getchat_deals = Deals::withTranslation([$request->lang])->get();
        $getchat_deals = $getchat_deals->translate($request->lang);
        if (!$getchat_deals->isEmpty()) {
            foreach ($getchat_deals as $k => $v) {
                $array[$k]['id '] = $v->id ?? null;
                $array[$k]['image'] = $v->image ?? null;
                $array[$k]['url'] = $v->url ?? null;
            }
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'No record found.', 'data' => []]);
        }
    }


    public function Getfavoritechatrooms(Request $request)
    {
        $array = array();
        $getfaviourite_chats = FavoriteChatRoom::withTranslation([$request->lang])->get();
        $getfaviourite_chats = $getfaviourite_chats->translate($request->lang);
        if (!$getfaviourite_chats->isEmpty()) {
            foreach ($getfaviourite_chats as $k => $v) {
                $array[$k]['id '] = $v->id ?? null;
                $array[$k]['userid'] = $v->userid ?? null;
                $array[$k]['chatroomid'] = $v->chatroomid ?? null;
                $array[$k]['chatroom_image'] = $v->chatroom_image ?? null;
                $array[$k]['status'] = $v->status ?? null;
            }
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'No record found.', 'data' => []]);
        }
    }

    public function Getreportingusers(Request $request)
    {
        $array = array();
        $getreportusers_chats = ReportingUsers::withTranslation([$request->lang])->get();
        $getreportusers_chats = $getreportusers_chats->translate($request->lang);
        if (!$getreportusers_chats->isEmpty()) {
            foreach ($getreportusers_chats as $k => $v) {
                $array[$k]['id '] = $v->id ?? null;
                $array[$k]['userid'] = $v->userid ?? null;
                $array[$k]['against_id'] = $v->against_id ?? null;
                $array[$k]['complain_number'] = $v->complain_number ?? null;
                $array[$k]['status'] = $v->status ?? null;
                $array[$k]['description'] = $v->description ?? null;
            }
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'No record found.', 'data' => []]);
        }
    }
}
