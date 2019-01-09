package com.getsmart.at;
import org.qtproject.qt5.android.bindings.QtApplication;
import android.content.Intent;
import android.app.Application;

import android.util.Log;
import org.json.JSONObject;
import org.pwf.notificator.NotificatorBinding;

public class FDMApplication extends QtApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        //NotificatorBinding.mainContext = getApplicationContext() ;
    }

}
