package org.pwf.notificator;
import com.getsmart.at.AlarmReceiver;
import com.getsmart.at.R;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.media.RingtoneManager;
import android.net.Uri;
import android.support.v4.app.NotificationCompat;
import android.support.v4.app.TaskStackBuilder;
import android.util.Log;
import android.graphics.drawable.Icon;
import java.util.Calendar;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.provider.MediaStore;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import static android.content.Context.ALARM_SERVICE;

public class NotificatorBinding {
    public static final String TAG="NotificatorBinding";
    public static final int DAILY_REMINDER_REQUEST_CODE=100;

    // native function for callback
    public static native void notificationReceive(String nmea);
    public static native void notificationOpen(String nmea);
    public static int FIND_NEW_ARTICLE = 0;
    // Singleton instance created as soon as possibile
    public static final NotificatorBinding m_instance = new NotificatorBinding();
    public static Context mainContext;

    //! Expose other basic function for consumption
    private static void sendTag(String key, String value) {

    }
    public static void setReminder(int hour, int min) {
        Log.d(TAG, "setReminder: "+hour+" "+ min);
        Calendar calendar = Calendar.getInstance();

                Calendar setcalendar = Calendar.getInstance();
                setcalendar.set(Calendar.SECOND, setcalendar.get(Calendar.SECOND) + 10);


                Intent intent1 = new Intent(NotificatorBinding.mainContext, AlarmReceiver.class);
                intent1.putExtra("REMINDER",true);
                PendingIntent pendingIntent = PendingIntent.getBroadcast(NotificatorBinding.mainContext, 0, intent1, 0);
                AlarmManager am = (AlarmManager) NotificatorBinding.mainContext.getSystemService(ALARM_SERVICE);
                am.set(AlarmManager.RTC, setcalendar.getTimeInMillis(),  pendingIntent);//AlarmManager.INTERVAL_DAY,

    }
public static Bitmap getBitmapFromURL(String src) {
    try {
        URL url = new URL(src);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setDoInput(true);
        connection.connect();
        InputStream input = connection.getInputStream();
        Bitmap myBitmap = BitmapFactory.decodeStream(input);
        return myBitmap;
    } catch (IOException e) {
        e.printStackTrace();
        return null;
    }
}
public static void showNotification(String title,String content)
   {
      showNotification(NotificatorBinding.mainContext,title,content);

   }

public static void showNotification(Context context, String title,String content)
   {

    }
    private static void deleteTag(String key) {

    }

}
