<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\API\ContactUs;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ContactUsController extends Controller
{
    public $successStatus = 200;
    public $HTTP_FORBIDDEN = 403;
    public $HTTP_NOT_FOUND = 404;

    public function contactUs(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'message' => 'required',
        ]);
        if ($validate->fails()) {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'Validation error.', 'data' => $validate->errors()->all()[0]]);
        }
        $input = $request->all();
        $input['status'] = 'New';
        $input['created_at'] = Carbon::now();
        $input['updated_at'] = Carbon::now();
        ContactUs::create($input);
        return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Contact form applied successfully you will be contacted soon.']);
    }
}
