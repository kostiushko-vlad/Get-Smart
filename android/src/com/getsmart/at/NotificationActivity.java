package com.getsmart.at;
import org.pwf.notificator.NotificatorBinding;
import android.content.IntentFilter;
import android.os.Bundle;
import android.content.Intent;
import android.util.Log;

public class NotificationActivity extends org.qtproject.qt5.android.bindings.QtActivity {
    public static final String TAG="NativeActivity";
    @Override
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        NotificatorBinding.mainContext = this;
    }
}
