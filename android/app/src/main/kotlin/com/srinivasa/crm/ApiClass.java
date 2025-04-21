
package com.srinivasa.crm;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.location.Location;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.BatteryManager;
import android.os.Build;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.RequiresApi;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.security.cert.X509Certificate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;  
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class ApiClass {
    private Context context;
    private static final String TAG = "ApiCaller"; // Tag for logging
    private static final String postUrl = "https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations"; // Change the post URL as needed
    // private static final String postUrl = "https://crmapitest.srinivasa.co:8446/crm_sfpl/se/locations-list"; // Change the post URL as needed

    public ApiClass(Context context) {
        this.context = context;
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    public void callAPI(double latitude, double longitude) {


        // -------------------------------------------------------------------------------- OLD API CODE STARTSS HEREE ----------------------------------------
        disableSSLCertificateChecking();
        try {
             int batteryLevel = getBatteryLevel();
            SharedPreferences sharedPreferences = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
            String tokenValue = sharedPreferences.getString("flutter.token", null);
            String userIdValue = sharedPreferences.getString("flutter.userId", null);
            // Log.d(TAG, "api printing tokenValue: " + tokenValue);
            // Log.d(TAG, "api printing userIdValue: " + userIdValue);

            JSONObject data = new JSONObject();
            data.put("latitude", latitude);
            data.put("longitude", longitude);
            data.put("userDateTime", LocalDateTime.now().toString());
            data.put("batteryStatus", String.valueOf(batteryLevel));
            StringRequest request = new StringRequest(
                    Request.Method.POST, postUrl,  // Replace with your actual endpoint
                    new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            Log.d("api", "API Response: " + response);
                            // Toast.makeText(context, "Api is successful", Toast.LENGTH_LONG).show();

                            // Toast.makeText(context, "Response: " + response, Toast.LENGTH_LONG).show();
                        }
                    },
                    new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Log.e("api", "API Error: " + error.getMessage(), error);
                            // Toast.makeText(context, "Error: " + error.getMessage(), Toast.LENGTH_LONG).show();
                        }
                    }) {
                @Override
                public String getBodyContentType() {
                    return "application/json; charset=utf-8";
                }

                @Override
                public byte[] getBody() {
                    return data.toString().getBytes();
                }

                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    Map<String, String> headers = new HashMap<>();
                    headers.put("Content-Type", "application/json; charset=utf-8");
                    if (tokenValue != null) {
                        headers.put("Authorization", "Bearer " + tokenValue);
                    }
                    return headers;
                }
            };

            Volley.newRequestQueue(context).add(request);
        } catch (JSONException e) {
            Log.e("api", "Error preparing API request", e);
            Toast.makeText(context, "Error occurred while preparing API request", Toast.LENGTH_LONG).show();

        }
        // -------------------------------------------------------------------------------- OLD API CODE ENDS  HEREE --------------------------------------------------------------------------------
        // Log.d(TAG, "callAPI called with latitude: " + latitude + ", longitude: " + longitude);

        // // Get battery level
        // int batteryLevel = getBatteryLevel();
        // Log.d(TAG, "Battery level: " + batteryLevel);

        // // Prepare data to insert locally when the network is unavailable
        // JSONObject data = new JSONObject();
        // try {
        //     data.put("latitude", latitude);
        //     data.put("longitude", longitude);
        //     data.put("userDateTime", LocalDateTime.now().toString());
        //     data.put("batteryStatus", String.valueOf(batteryLevel));

        //     // Insert data into the local database
        //     Log.d(TAG, "Inserting data into local database...");
        //     DatabaseHelper dbHelper = new DatabaseHelper(context);
        //     long result = dbHelper.insertLocationData(
        //             String.valueOf(latitude),
        //             String.valueOf(longitude),
        //             LocalDateTime.now().toString(),
        //             String.valueOf(batteryLevel)
        //     );

        //     if (result != -1) {
        //         Log.d(TAG, "Data inserted successfully into local database");

        //         // Check if network is available to send the data to the server
        //         if (isNetworkAvailable()) {
        //             Log.d(TAG, "Network is available, sending data to server...");
        //             // sendToServer(context, batteryLevel);
        //         } else {
        //             Log.d(TAG, "Network is not available, data stored locally");
        //         }
        //     } else {
        //         // sendToServer(context, batteryLevel);
        //         Log.e(TAG, "Failed to insert data into local database");
        //     }

        // } catch (JSONException e) {
        //     Log.e(TAG, "Error preparing data for local database insertion", e);
        // }
    }

    // Method to send data to the server
    private void sendToServer(Context context, int batteryLevel) {
        Log.d(TAG, "Preparing to send data to the server...");

        // Fetch the token and user ID from SharedPreferences
        SharedPreferences sharedPreferences = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
        String tokenValue = sharedPreferences.getString("flutter.token", null);
        String userIdValue = sharedPreferences.getString("flutter.userId", null);

        // Check if token is missing
        if (tokenValue == null || tokenValue.isEmpty()) {
            Log.e(TAG, "Token is missing or invalid.");
            return; // Stop if there's no valid token
        }

        Log.d(TAG, "Token: " + tokenValue);
        Log.d(TAG, "User ID: " + userIdValue);

        // Fetch location data from database
        DatabaseHelper dbHelper = new DatabaseHelper(context);
        List<Location> locationsList = getLocationDataFromDatabase(context);

        // Prepare JSON array for the locations
        JSONArray locationsArray = new JSONArray();
        for (Location location : locationsList) {
            try {
                // Create JSON object for each location
                JSONObject locationObject = new JSONObject();
                locationObject.put("latitude", location.getLatitude());
                locationObject.put("longitude", location.getLongitude());
                locationObject.put("userDateTime", location.getDateTime());
                locationObject.put("batteryStatus", batteryLevel + "%");

                // Add to the locations array
                locationsArray.put(locationObject);

            } catch (JSONException e) {
                Log.e(TAG, "Error creating JSON object for location: ", e);
            }
        }

        // Create the final JSON body
        JSONObject dataToSend = new JSONObject();
        try {
            dataToSend.put("locationsList", locationsArray);
        } catch (JSONException e) {
            Log.e(TAG, "Error creating the data to send: ", e);
        }

        // Log the JSON data being sent
        Log.d(TAG, "Data to send: " + dataToSend.toString());

        // Create the Volley request
        StringRequest request = new StringRequest(Request.Method.POST, postUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.d(TAG, "API Response: " + response);
                        DatabaseHelper dbHelper = new DatabaseHelper(context);
                        // Clear the local data after successful API call
                        dbHelper.deleteAllLocationData();
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e(TAG, "API Error: " + error.getMessage(), error);
                        if (error instanceof AuthFailureError) {
                            Log.e(TAG, "Authentication failed. Please check token.");
                        }
                    }
                }) {

            @Override
            public String getBodyContentType() {
                return "application/json; charset=utf-8";
            }

            @Override
            public byte[] getBody() {
                return dataToSend.toString().getBytes();
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = new HashMap<>();
                headers.put("Content-Type", "application/json; charset=utf-8");
                if (tokenValue != null) {
                    headers.put("Authorization", "Bearer " + tokenValue); // Include token in the Authorization header
                }

                // Log the headers for debugging
                Log.d(TAG, "Authorization Header: Bearer " + tokenValue);
                return headers;
            }
        };

        // Add the request to the Volley queue
        Log.d(TAG, "Adding request to Volley queue...");
        Volley.newRequestQueue(context).add(request);
    }

    public List<Location> getLocationDataFromDatabase(Context context) {
        SQLiteDatabase db = new DatabaseHelper(context).getReadableDatabase();
        List<Location> locationList = new ArrayList<>();
        Cursor cursor = null;
        try {
            cursor = db.rawQuery("SELECT * FROM location", null);
            if (cursor.moveToFirst()) {
                do {
                    double latitude = cursor.getDouble(cursor.getColumnIndexOrThrow("latitude"));
                    double longitude = cursor.getDouble(cursor.getColumnIndexOrThrow("longitude"));
                    String userDateTime = cursor.getString(cursor.getColumnIndexOrThrow("userDateTime"));

                    // Create a Location object
                    Location location = new Location(latitude, longitude, userDateTime);
                    locationList.add(location);

                } while (cursor.moveToNext());
            }
        } catch (Exception e) {
            Log.e(TAG, "Error fetching location data: ", e);
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
        return locationList;
    }

    public class Location {
        private double latitude;
        private double longitude;
        private String dateTime;

        // Constructor
        public Location(double latitude, double longitude, String dateTime) {
            this.latitude = latitude;
            this.longitude = longitude;
            this.dateTime = dateTime;
        }

        // Getters
        public double getLatitude() {
            return latitude;
        }

        public double getLongitude() {
            return longitude;
        }

        public String getDateTime() {
            return dateTime;
        }

        // Setters (optional)
        public void setLatitude(double latitude) {
            this.latitude = latitude;
        }

        public void setLongitude(double longitude) {
            this.longitude = longitude;
        }

        public void setDateTime(String dateTime) {
            this.dateTime = dateTime;
        }

        // Optional: Override toString for debugging
        @Override
        public String toString() {
            return "Location{" +
                    "latitude=" + latitude +
                    ", longitude=" + longitude +
                    ", dateTime='" + dateTime + '\'' +
                    '}';
        }
    }





    // Check if the device is connected to the internet
    private boolean isNetworkAvailable() {
        disableSSLCertificateChecking();
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        boolean isNetworkAvailable = activeNetworkInfo != null && activeNetworkInfo.isConnected();
        Log.d(TAG, "Network available: " + isNetworkAvailable);
        return isNetworkAvailable;
    }

    // Get the battery level of the device
    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) context.getSystemService(Context.BATTERY_SERVICE);
            if (batteryManager != null) {
                batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
            }
        } else {
            Intent intent = new ContextWrapper(context).registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            if (intent != null) {
                int level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
                int scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
                if (level != -1 && scale != -1) {
                    batteryLevel = (int) ((level / (float) scale) * 100);
                }
            }
        }
        Log.d(TAG, "Battery level retrieved: " + batteryLevel);
        return batteryLevel;
    }
    public static void disableSSLCertificateChecking() {
        try {
            TrustManager[] trustAllCertificates = new TrustManager[]{
                    new X509TrustManager() {
                        public X509Certificate[] getAcceptedIssuers() {
                            return null;
                        }

                        public void checkClientTrusted(X509Certificate[] certs, String authType) {
                        }

                        public void checkServerTrusted(X509Certificate[] certs, String authType) {
                        }
                    }
            };

            SSLContext sc = SSLContext.getInstance("TLS");
            sc.init(null, trustAllCertificates, new java.security.SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

            HttpsURLConnection.setDefaultHostnameVerifier((hostname, session) -> true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



////    package com.example.srinivasa_crm_new;
//package com.srinivasa.crm;
//
//
//import android.content.Context;
//import android.content.ContextWrapper;
//import android.content.Intent;
//import android.content.IntentFilter;
//import android.content.SharedPreferences;
//import android.net.ConnectivityManager;
//import android.net.NetworkInfo;
//import android.os.BatteryManager;
//import android.os.Build;
//import android.util.Log;
//import android.widget.Toast;
//
//import androidx.annotation.RequiresApi;
//
//import com.android.volley.AuthFailureError;
//import com.android.volley.DefaultRetryPolicy;
//import com.android.volley.Request;
//import com.android.volley.Response;
//import com.android.volley.VolleyError;
//import com.android.volley.toolbox.StringRequest;
//import com.android.volley.toolbox.Volley;
//import com.google.type.DateTime;
//
//import org.json.JSONException;
//import org.json.JSONObject;
//
//import java.time.LocalDateTime;
//import java.util.HashMap;
//import java.util.Map;
//import javax.net.ssl.*;
//import java.security.cert.X509Certificate;
//
//public class ApiClass {
//    private  Context context;
//
//    //  private String postUrl = "http://65.109.229.140:8080/crmsfpl/se/locations";
//    // private String postUrl = "http://192.168.1.45:8080/crmsfpl/se/locations";
//  private String postUrl = "http://180.149.244.56:8081/crm_sfpl/se/locations";
////    private String postUrl = "http://192.168.1.183:8081/crm_sfpl/se/locations";
////    private String postUrl = "https://95.216.201.117:8446/crm_sfpl/se/locations";
//    private String TAG = "ApiCaller"; // Tag for logging
//    private LocationHelperClass locationHelperClass;
//
//    public ApiClass(Context context) {
//        this.context = context;
//
//    }
//
//    public static void disableSSLCertificateChecking() {
//        try {
//            TrustManager[] trustAllCertificates = new TrustManager[]{
//                    new X509TrustManager() {
//                        public X509Certificate[] getAcceptedIssuers() {
//                            return null;
//                        }
//
//                        public void checkClientTrusted(X509Certificate[] certs, String authType) {
//                        }
//
//                        public void checkServerTrusted(X509Certificate[] certs, String authType) {
//                        }
//                    }
//            };
//
//            SSLContext sc = SSLContext.getInstance("TLS");
//            sc.init(null, trustAllCertificates, new java.security.SecureRandom());
//            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
//
//            HttpsURLConnection.setDefaultHostnameVerifier((hostname, session) -> true);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    @RequiresApi(api = Build.VERSION_CODES.O)
//    public void callAPI(double latitude, double longitude) {
//        // Log.d(TAG, "api: " + latitude + ", longitude: " + longitude);
//        Log.d(TAG, "api: " + latitude + ", longitude: " + longitude);
//        int batteryLevel = -1;
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
//            BatteryManager batteryManager = (BatteryManager) context.getSystemService(Context.BATTERY_SERVICE);
//            if (batteryManager != null) {
//                batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
//            }
//        } else {
//            Intent intent = new ContextWrapper(context).registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
//            if (intent != null) {
//                int level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
//                int scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
//                if (level != -1 && scale != -1) {
//                    batteryLevel = (int) ((level / (float) scale) * 100);
//                }
//            }
//        }
//
//
//        //     OfflineRequestModel request = new OfflineRequestModel(String.valueOf(latitude), String.valueOf(longitude), LocalDateTime.now().toString(), String.valueOf(batteryLevel));
//
//        //     OfflineDatabaseHelper offlineDatabaseHelper = new OfflineDatabaseHelper(context.getApplicationContext());
//        //     offlineDatabaseHelper.insertOfflineRequest(request);
//        // Log.d("localDatabase", "PRINTING BATTER VALUE " + batteryLevel);
//        //     Log.d("localDatabase", "SAVING DATA IN LOCAL DB");
//
//
////        ONLINE CODEEEcle
//
////
//        if (isNetworkAvailable()) {
//           disableSSLCertificateChecking();
//
//            Log.d(TAG, "api: " + "NETWORK IS AVAILABLE");
//
//            try {
//                SharedPreferences sharedPreferences = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
//                String tokenValue = sharedPreferences.getString("flutter.token", null);
//                String userIdValue = sharedPreferences.getString("flutter.userId", null);
//                // Log.d(TAG, "api printing tokenValue: " + tokenValue);
//                // Log.d(TAG, "api printing userIdValue: " + userIdValue);
//
//                JSONObject data = new JSONObject();
//                data.put("latitude", latitude);
//                data.put("longitude", longitude);
//                data.put("userDateTime", LocalDateTime.now().toString());
//                data.put("batteryStatus", String.valueOf(batteryLevel));
//
//                try {
////                    DatabaseHelper dbHelper = new DatabaseHelper(context);
//
//                    // Save data to SQLite
////                    long result = dbHelper.insertLocationData(
////                            String.valueOf(latitude),
////                            String.valueOf(longitude),
////                            LocalDateTime.now().toString(),
////                            String.valueOf(batteryLevel)
////                    );
//
////                    if (result != -1) {
////                        Log.d("Database", "Data inserted successfully to local");
////                        // dbHelper.logLocationData();
////                    } else {
////                        Log.e("Database", "Failed to insert data to localll");
////                    }
//                } catch (Exception e) {
//                    Log.e("DatabaseError", "An error occurred while inserting data: " + e.getMessage(), e);
//                }
//
//
//                StringRequest request = new StringRequest(
//                        Request.Method.POST, postUrl,  // Replace with your actual endpoint
//                        new Response.Listener<String>() {
//                            @Override
//                            public void onResponse(String response) {
//                                Log.d("api", "API Response: " + response);
//                                // Toast.makeText(context, "Api is successful", Toast.LENGTH_LONG).show();
//
//                                // Toast.makeText(context, "Response: " + response, Toast.LENGTH_LONG).show();
//                            }
//                        },
//                        new Response.ErrorListener() {
//                            @Override
//                            public void onErrorResponse(VolleyError error) {
//                                Log.e("api", "API Error: " + error.getMessage(), error);
//                                // Toast.makeText(context, "Error: " + error.getMessage(), Toast.LENGTH_LONG).show();
//                            }
//                        }) {
//                    @Override
//                    public String getBodyContentType() {
//                        return "application/json; charset=utf-8";
//                    }
//
//                    @Override
//                    public byte[] getBody() {
//                        return data.toString().getBytes();
//                    }
//
//                    @Override
//                    public Map<String, String> getHeaders() throws AuthFailureError {
//                        Map<String, String> headers = new HashMap<>();
//                        headers.put("Content-Type", "application/json; charset=utf-8");
//                        if (tokenValue != null) {
//                            headers.put("Authorization", "Bearer " + tokenValue);
//                        }
//                        return headers;
//                    }
//                };
//
//                Volley.newRequestQueue(context).add(request);
//            } catch (JSONException e) {
//                Log.e("api", "Error preparing API request", e);
//                Toast.makeText(context, "Error occurred while preparing API request", Toast.LENGTH_LONG).show();
//            }
//        } else {
//
////             WHEN NETWORK IS NOT AVAILABLE
//            Log.d(TAG, "api: " + "NETWORK IS NOT AVAILABLE");
//
//            try {
//                SharedPreferences sharedPreferences = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
//                String tokenValue = sharedPreferences.getString("flutter.token", null);
//                String userIdValue = sharedPreferences.getString("flutter.userId", null);
//                // Log.d(TAG, "api printing tokenValue: " + tokenValue);
//                // Log.d(TAG, "api printing userIdValue: " + userIdValue);
//
//                JSONObject data = new JSONObject();
//                data.put("latitude", latitude);
//                data.put("longitude", longitude);
//                data.put("userDateTime", LocalDateTime.now().toString());
//                data.put("batteryStatus", String.valueOf(batteryLevel));
//
//                try {
//                    DatabaseHelper dbHelper = new DatabaseHelper(context);
//
////                     Save data to SQLite
////                    long result = dbHelper.insertLocationData(
////                            String.valueOf(latitude),
////                            String.valueOf(longitude),
////                            LocalDateTime.now().toString(),
////                            String.valueOf(batteryLevel)
////                    );
////
////                    if (result != -1) {
////                        Log.d("Database", "Data inserted successfully");
////                        // dbHelper.logLocationData();
////                    } else {
////                        Log.e("Database", "Failed to insert data");
////                    }
//                } catch (Exception e) {
//                    Log.e("DatabaseError", "An error occurred while inserting data: " + e.getMessage(), e);
//                }
//
//
//
//
//                // Volley.newRequestQueue(context).add(request);
//            } catch (JSONException e) {
//                 Log.e("api", "Error preparing API request", e);
//            }
//
//
//        }
//
//
//    }
//
//
//
//
//
//
//
//    private boolean isNetworkAvailable() {
//        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
//        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
//        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
//    }
//}