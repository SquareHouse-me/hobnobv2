<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\API\TermsAndCondition;
use Illuminate\Http\Request;

class TermsAndConditionController extends Controller
{
    public $successStatus = 200;
    public $HTTP_FORBIDDEN = 403;
    public $HTTP_NOT_FOUND = 404;

    public function termsAndCondition(Request $request)
    {
        $array = array();
        $termsAndCondition = TermsAndCondition::withTranslation([$request->lang])->get();
        $termsAndCondition = $termsAndCondition->translate($request->lang);
        if (!$termsAndCondition->isEmpty()) {
            foreach ($termsAndCondition as $k => $v) {
                $array[$k]['content'] = $v->content ?? null;
            }
            return response()->json(['success' => true, 'status' => $this->successStatus, 'message' => 'Record found.', 'data' => $array]);
        } else {
            return response()->json(['error' => false, 'status' => $this->HTTP_NOT_FOUND, 'message' => 'No record found.', 'data' => []]);
        }
    }
}
