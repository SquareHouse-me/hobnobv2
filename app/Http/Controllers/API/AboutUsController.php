<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\API\AboutUs;
use Illuminate\Http\Request;

class AboutUsController extends Controller
{
    public $successStatus = 200;
    public $HTTP_FORBIDDEN = 403;
    public $HTTP_NOT_FOUND = 404;

    public function aboutUs(Request $request)
    {
        $array = array();
        $aboutUs = AboutUs::withTranslation([$request->lang])->get();
        $aboutUs = $aboutUs->translate($request->lang);
        if (!$aboutUs->isEmpty()) {
            foreach ($aboutUs as $k => $v) {
                $array[$k]['content'] = $v->content ?? null;
            }
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'No record found.', 'data' => []]);
        }
    }
}
