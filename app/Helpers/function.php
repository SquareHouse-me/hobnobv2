<?php

function getOldCodes() {
    $find = \App\Models\API\AppUser::pluck('code')->toArray();
    return $find;
}
function validateSecurityCode() {
    $code = intval(rand(111111, 999999));
    if(!isset($oldCodes)) {
        $oldCodes = getOldCodes();
    }
    if(in_array($code, $oldCodes)) {
        validateSecurityCode();
    } else {
        return $code;
    }
}
