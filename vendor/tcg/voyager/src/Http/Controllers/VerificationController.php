<?php

namespace TCG\Voyager\Http\Controllers;
use Illuminate\Support\Facades\DB;
use App\Models\API\AppUser;
use App\Models\API\ContactUs;
use TCG\Voyager\Models\Notification;

class VerificationController extends VoyagerBaseController
{
   
    public function appUserVerification($id)
    {
        $user = AppUser::find($id);
        // dd($user);
        if($user->verified > 0){
            $user->verified = 0;
        } else{
            $user->verified = 1;
        }
        $user->save();

        return response()->json(['success' => true]);
    }


    public function appUserStatus($id)
    {
        $appuser = AppUser::find($id);
        // dd($appuser);
        if($appuser->status == 'Unactive'){
            $appuser->status = 'Active';
        } else{
            $appuser->status = 'Unactive';
        }
        $appuser->save();

        return response()->json(['success' => true]);
    }



    public function contactStatus($id)
    {
        $contact = ContactUs::find($id);
        // dd($contact);
        if($contact->status == 'Viewed'){
            $contact->status = 'New';
        } else{
            $contact->status = 'Viewed';
        }
        $contact->save();

        return response()->json(['success' => true]);
    }


    public function archiveStatus($id)
    {
        $notification = Notification::find($id);
        // dd($notification);
       
        if($notification->status == 'Unarchived'){
            $notification->status = 'Archived';
        } else{
            $notification->status = 'Unarchived';
        }
        $notification->save();

        return response()->json(['success' => true]);
    }

}
