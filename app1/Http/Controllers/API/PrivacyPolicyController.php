<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\API\PrivacyPolicy;
use Illuminate\Http\Request;

class PrivacyPolicyController extends Controller
{
    public $successStatus = 200;
    public $HTTP_FORBIDDEN = 403;
    public $HTTP_NOT_FOUND = 404;

    public function privacyPolicy(Request $request)
    {
        $array = array();
        $privacyPolicy = PrivacyPolicy::withTranslation([$request->lang])->get();
        $privacyPolicy = $privacyPolicy->translate($request->lang);
        if (!$privacyPolicy->isEmpty()) {
            foreach ($privacyPolicy as $k => $v) {
                $array[$k]['content'] = $v->content ?? null;
            }
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'No record found.', 'data' => []]);
        }
    }
}
