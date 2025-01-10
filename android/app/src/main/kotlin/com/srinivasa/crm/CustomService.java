
package com.srinivasa.crm;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.util.Log;

import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;



import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class CustomService extends Service {
    private static final String TAG = "BACKGROUND_TASKS";
    //    private static final long INTERVAL = 5 * 1000; // Run task every 5 seconds
    // private static final long INTERVAL = 60 * 1000; 
    // private static final long INTERVAL = 15 * 60 * 1000; // Run task every 2 minutes
    private static final long INTERVAL = 10  * 60 * 1000; // Run task every 2 minutes

    // Run task every 5 seconds
    private static final String CHANNEL_ID = "ForegroundServiceChannel";
    private LocationHelperClass locationHelperClass;

    private Timer timer;
    private Handler handler;

    @Override
    public void onCreate() {
        super.onCreate();
        Log.d(TAG, "BG ON CREATED STARTED");

        // Initialize timer and handler
        timer = new Timer();
        handler = new Handler();
        locationHelperClass = new LocationHelperClass(this);

        // Create notification channel for foreground service
        createNotificationChannel();

        // Start the service in the foreground with a notification
        Notification notification = new NotificationCompat.Builder(this, CHANNEL_ID)
                .setContentTitle("SFPL CRM App")
                .setContentText("Running background services")
                .setSmallIcon(R.drawable.notificationss) // Replace with your own icon
                .build();
        startForeground(1, notification);

        // Schedule the TimerTask to run every INTERVAL milliseconds
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                handler.post(() -> {
                    // Do network call or any other task here
                    performTask();
                });
            }
        }, 0, INTERVAL); // Start immediately and repeat every INTERVAL milliseconds
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy()");
        // Cancel the timer when the service is destroyed
        if (timer != null) {
            timer.cancel();
        }
    }

    private void performTask() {
        Log.d(TAG, "BACKGROUND TASK STARTED");


        locationHelperClass.getLatLongValues();
        // Log.d(TAG, "Bg Task performed at: " + new Date());
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel serviceChannel = new NotificationChannel(
                    CHANNEL_ID,
                    "Foreground Service Channel",
                    NotificationManager.IMPORTANCE_DEFAULT
            );
            NotificationManager manager = getSystemService(NotificationManager.class);
            if (manager != null) {
                manager.createNotificationChannel(serviceChannel);
            }
        }
    }
}