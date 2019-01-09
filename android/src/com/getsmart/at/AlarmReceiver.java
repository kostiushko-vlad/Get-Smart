package com.getsmart.at;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import org.pwf.notificator.NotificatorBinding;

/**
 * Created by Jaison on 17/06/17.
 */

public class AlarmReceiver extends BroadcastReceiver {

    String TAG = "AlarmReceiver";

    @Override
    public void onReceive(Context context, Intent intent) {
        // TODO Auto-generated method stub

//        if (intent.getAction() != null && context != null) {
//            if (intent.getAction().equalsIgnoreCase(Intent.ACTION_BOOT_COMPLETED)) {
//                // Set the alarm here.
//                Log.d(TAG, "onReceive: BOOT_COMPLETED");
//               // LocalData localData = new LocalData(context);
//                //NotificationScheduler.setReminder(context, AlarmReceiver.class, localData.get_hour(), localData.get_min());
//                return;
//            }
//        }

        Log.d(TAG, "onReceive: ");


        Intent intentForService = new Intent(context, NotificationIntentService.class);

                intentForService.setAction(intent.getAction());
                intentForService.setData(intent.getData());
                intentForService.replaceExtras(intent.getExtras());

                context.startService(intentForService);
        //Trigger the notification
        //NotificatorBinding.showNotification(context.getApplicationContext(),"You have 5 unwatched videos", "Watch them now?");

    }
}
