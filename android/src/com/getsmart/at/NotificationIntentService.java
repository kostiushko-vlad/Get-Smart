package com.getsmart.at;
import org.qtproject.qt5.android.bindings.QtActivity;
import com.getsmart.at.R;
import android.os.Bundle;
import android.app.IntentService;
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
import com.getsmart.at.NativeActivity;
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
import org.pwf.notificator.NotificatorBinding;

public class NotificationIntentService extends IntentService {
    public static final String TAG="NotificationIntentService";
    public static final int DAILY_REMINDER_REQUEST_CODE=100;
    //You'll need some boilerplate like the constructor for this new class
    public NotificationIntentService(){
            super("NotificationIntentService");
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
    @Override
    protected void onHandleIntent(final Intent intent) {
         Bundle extras = intent.getExtras();
        Uri alarmSound = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);

       //       Intent notificationIntent = new Intent(context, NotificationIntentService.class);
       //       notificationIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        //TaskStackBuilder stackBuilder = TaskStackBuilder.create(this);
        //stackBuilder.addParentStack(NativeActivity.class);
        //stackBuilder.addNextIntent(intent);
        Intent notificationIntent = new Intent(this, NativeActivity.class);
        notificationIntent.setAction(intent.getAction());
        notificationIntent.setData(intent.getData());
        notificationIntent.replaceExtras(intent.getExtras());

        PendingIntent pendingIntent  = PendingIntent.getActivity(this, DAILY_REMINDER_REQUEST_CODE,notificationIntent,PendingIntent.FLAG_UPDATE_CURRENT);
        //PendingIntent pendingIntent = stackBuilder.getPendingIntent(DAILY_REMINDER_REQUEST_CODE, PendingIntent.FLAG_UPDATE_CURRENT);

        NotificationCompat.Builder builder = new NotificationCompat.Builder(this);
        Bitmap img = BitmapFactory.decodeResource(getResources(), R.drawable.idea);
        // Uri uri = Uri.parse("android.resource://org.qtproject.example/drawable/icon");
        // Icon icon = Icon.createWithContentUri(uri);
         //Uri imageUri = uri.getData();
        //         Bitmap bitmap = MediaStore.Images.Media.getBitmap(mainContext.getContentResolver(), imageUri);
        Notification notification = builder.setContentTitle("Time to learn something new!")
                .setContentText("Tap to get new article")
                .setAutoCancel(true)
                .setSound(alarmSound)
                .setLargeIcon(img)
                .setSmallIcon(R.drawable.icon)
                .setContentIntent(pendingIntent).build();

        NotificationManager notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        notificationManager.notify(DAILY_REMINDER_REQUEST_CODE, notification);
    }
}
