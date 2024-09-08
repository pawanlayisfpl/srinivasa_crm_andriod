package com.example.srinivasa_crm_new;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
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
        apiClass = new ApiClass(context);
        fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(context);

        locationCallback = new LocationCallback() {
            @Override
            public void onLocationResult(@NonNull LocationResult locationResult) {
                if (locationResult == null) {
                    // Log.d("latlng", "LocationResult is null.");
                    return;
                }

                for (Location location : locationResult.getLocations()) {
                    if (location != null) {
                        double latitude = location.getLatitude();
                        double longitude = location.getLongitude();
//                        Log.d("latlng", "Updated Location Latitude: " + latitude + ", Longitude: " + longitude);
//                        // Implement API call here
//                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//                            apiClass.callAPI(latitude, longitude);
//                        }
                    } else {
                        // Log.d("latlng", "Location is null in LocationResult.");
                    }
                }
            }
        };
    }

    public void getLatLongValues() {
        if (ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            // Check if location services are enabled
            if (isLocationEnabled()) {
                LocationRequest locationRequest = LocationRequest.create();
                locationRequest.setPriority(LocationRequest.PRIORITY_HIGH_ACCURACY);
                locationRequest.setInterval(5000); // 5 seconds
                locationRequest.setFastestInterval(5000); // 5 seconds

                // Log.d("BACKGROUND_TASKS", "Starting location updates");

                // Request location updates
                fusedLocationProviderClient.requestLocationUpdates(locationRequest, locationCallback, Looper.getMainLooper());

                // Get last known location
                fusedLocationProviderClient.getLastLocation()
                        .addOnSuccessListener(location -> {
                            if (location != null) {
                                double latitude = location.getLatitude();
                                double longitude = location.getLongitude();
                                // Log.d("latlng", "Last Location Latitude: " + latitude + ", Longitude: " + longitude);
                                // Implement API call here
                                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                                    apiClass.callAPI(latitude, longitude);
                                }
                            } else {
                                // Log.d("latlng", "Location is null from getLastLocation.");
                            }
                        })
                        .addOnFailureListener(e -> {
                            // Log.d("latlng", "Failed to get location: " + e.getMessage());
                        });
            } else {
                // Log.d("latlng", "Location services are disabled.");
                promptEnableLocationServices();
            }
        } else {
            // Log.d("latlng", "Location permission not granted");
            if (context instanceof Activity) {
                askPermission((Activity) context);
            } else {
                // Log.d("latlng", "Context is not an instance of Activity, cannot request permissions.");
            }
        }
    }

    private void promptEnableLocationServices() {
        if (context instanceof Activity) {
            Toast.makeText(context, "Location services are disabled. Please enable them.", Toast.LENGTH_LONG).show();
            context.startActivity(new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS));
        }
    }

    private boolean isLocationEnabled() {
        LocationManager locationManager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
        return locationManager != null && (locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)
                || locationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER));
    }

    public void askPermission(Activity activity) {
        ActivityCompat.requestPermissions(activity, new String[]{
                Manifest.permission.ACCESS_FINE_LOCATION
        }, 1);
    }
}
