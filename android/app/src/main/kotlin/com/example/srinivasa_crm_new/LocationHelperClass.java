package com.example.srinivasa_crm_new;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Looper;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;

public class LocationHelperClass {
    private final Context context;
    private final FusedLocationProviderClient fusedLocationProviderClient;
    private final LocationCallback locationCallback;

    private final ApiClass apiClass;
    public LocationHelperClass(Context context) {
        this.context = context;
        apiClass =  new ApiClass(context);
        fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(context);
        locationCallback = new LocationCallback() {
            @Override
            public void onLocationResult(@NonNull LocationResult locationResult) {
                //                        double latitude = location.getLatitude();
                //                        double longitude = location.getLongitude();
                //                        Log.d("latlng", "Latitude: " + latitude + ", Longitude: " + longitude);
                // Call your API here with the lat/long values
            }
        };
    }

    public void getLatLongValues() {
        if (ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            LocationRequest locationRequest = LocationRequest.create();
            locationRequest.setPriority(LocationRequest.PRIORITY_HIGH_ACCURACY);
            locationRequest.setInterval(5000); // 5 seconds
            locationRequest.setFastestInterval(5000); // 5 seconds

            fusedLocationProviderClient.requestLocationUpdates(locationRequest, locationCallback, Looper.getMainLooper());

            fusedLocationProviderClient.getLastLocation()
                    .addOnSuccessListener(location -> {
                        if (location != null) {
                            double latitude = location.getLatitude();
                            double longitude = location.getLongitude();
                            Log.d("latlng", "Last Location Latitude: " + latitude + ", Longitude: " + longitude);
                            // Implement API call here
                            apiClass.callAPI(latitude,longitude);

                        } else {
                            Log.d("latlng", "Location is null from getLastLocation.");
                        }
                    })
                    .addOnFailureListener(e -> {
                        Log.d("latlng", "Failed to get location: " + e.getMessage());
                    });
        } else {
            Log.d("latlng", "Location permission not granted");
            if (context instanceof Activity) {
                askPermission((Activity) context);
            } else {
                Log.d("latlng", "Context is not an instance of Activity, cannot request permissions.");
            }
        }
    }

    public void askPermission(Activity activity) {
        ActivityCompat.requestPermissions(activity, new String[]{
                Manifest.permission.ACCESS_FINE_LOCATION
        }, 1);
    }
}
