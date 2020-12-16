<?php

namespace TCG\Voyager\Http\Controllers;
use App\Models\API\DeviceToken;
use App\Models\API\Notification;

class NotificationController extends VoyagerBaseController
{
   
    public function sendNotification($id)
    {
        $notification = Notification::find($id);
        // dd($notification);
        $tokenList = DeviceToken::pluck('token')->toArray();
        // dd($tokenList);
        $fcmUrl = 'https://fcm.googleapis.com/fcm/send';
        // $tokenList[] = 'eCcZ-L2K49w:APA91bHyArn9JrTqLWl1vmd_3IgE-XIDEwKAFL5B5g3RVBrSfacFfvQrXuywNXZuE2WlplXBxkFxmHoZb5oSc1hZayy8XGght7j6AyC4cS7661ck9UHseayLNPcxopCX2nWdKSXKwB8D';
        // $tokenList[] = 'f0xnoyCn90orlDK8SLGX8N:APA91bHl1l8tO_GClxgjtjsXHbO_5viCxCKJ3dmLcYbzcCcE82wxymm3IVJV9dc2OpIRkfTWBM3frUQ5Q2ZdPi6LVtSnbPSp0I7Rk4DmSaagRfmkhnQ_uwHBH3i8S8atdtk4TsTOSb5H';
        $notification = [
            'title' => $notification->message_title,
            'text'  => $notification->message_body,
            'image'  => $notification->notification_image,
            'sound' => true,
        ];
        $extraNotificationData = ["message" => $notification,"moredata" =>'dd'];
        $fcmNotification = [
        'registration_ids' => $tokenList, //multple token array
        // 'to' => $token, //single token
        'notification' => $notification,
        'data' => $extraNotificationData
        ];
        $headers = [
        'Authorization: key='.env('FIREBASE_SERVER_KEY'),
        'Content-Type: application/json'
        ];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$fcmUrl);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));
        $result = curl_exec($ch);
        curl_close($ch);
        
        // print_r($result);
        return redirect()->back()->with('message', 'Notification sends successfully!');
    }

}
