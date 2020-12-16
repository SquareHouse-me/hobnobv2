<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\API\AppUser;
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
        $array = array();
        if (Auth::guard('app_user')->attempt(['email' => $request->email, 'password' => $request->password])) {
            $app_user = Auth::guard('app_user')->user();
            $array['id'] = $app_user->id;
            $array['username'] = $app_user->username;
            $array['phone'] = $app_user->phone;
            $array['email'] = $app_user->email;
            $array['gender'] = $app_user->gender ?? NULL;
            $array['token'] = $app_user->createToken('MyApp')->accessToken;
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
            AppUser::where('id', $request->id)->update(array('lat' => $request->lat, 'long' => $request->long ));
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Your location has been updated successfully.']);
        } else {
            return response()->json(['error' => false, 'status' => 401, 'message' => 'Please login to change gender.']);
        }
    }
}
