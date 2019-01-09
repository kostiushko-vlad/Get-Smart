package com.getsmart.at;
import org.pwf.notificator.NotificatorBinding;
import android.content.IntentFilter;
import android.os.Bundle;
import android.content.Intent;
import android.util.Log;
import android.app.AlertDialog;
public class NativeActivity extends org.qtproject.qt5.android.bindings.QtActivity {
    public static final String TAG="NativeActivity";
    @Override
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        //registerReceiver(new AlarmReceiver(), new IntentFilter(AlarmReceiver.class.getName()));
        NotificatorBinding.mainContext = this;
//        Intent intent = getIntent();
//        Boolean newArticle = intent.getBooleanExtra("REMINDER", false);
//        Log.d(TAG, "HAS NEW ARTICLE" + newArticle);
//        if(newArticle){
////            AlertDialog alertDialog = new AlertDialog.Builder(this).create();
////            alertDialog.setTitle("Notification show");
////            alertDialog.setMessage("test");
////            alertDialog.show();
//            NotificatorBinding.FIND_NEW_ARTICLE = 1;
//        }

    }
}
