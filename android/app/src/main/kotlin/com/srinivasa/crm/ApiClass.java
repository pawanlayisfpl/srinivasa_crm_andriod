//    package com.example.srinivasa_crm_new;
package com.srinivasa.crm;


import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.BatteryManager;
import android.os.Build;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.RequiresApi;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.type.DateTime;

import org.json.JSONException;
import org.json.JSONObject;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import javax.net.ssl.*;
import java.security.cert.X509Certificate;

public class ApiClass {
    private  Context context;

    //  private String postUrl = "http://65.109.229.140:8080/crmsfpl/se/locations";
    // private String postUrl = "http://192.168.1.45:8080/crmsfpl/se/locations";
  private String postUrl = "http://180.149.244.56:8081/crm_sfpl/se/locations";
//    private String postUrl = "http://192.168.1.183:8081/crm_sfpl/se/locations";
//    private String postUrl = "https://95.216.201.117:8446/crm_sfpl/se/locations";
    private String TAG = "ApiCaller"; // Tag for logging
    private LocationHelperClass locationHelperClass;

    public ApiClass(Context context) {
        this.context = context;

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

    @RequiresApi(api = Build.VERSION_CODES.O)
    public void callAPI(double latitude, double longitude) {
        // Log.d(TAG, "api: " + latitude + ", longitude: " + longitude);
        Log.d(TAG, "api: " + latitude + ", longitude: " + longitude);
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


        //     OfflineRequestModel request = new OfflineRequestModel(String.valueOf(latitude), String.valueOf(longitude), LocalDateTime.now().toString(), String.valueOf(batteryLevel));

        //     OfflineDatabaseHelper offlineDatabaseHelper = new OfflineDatabaseHelper(context.getApplicationContext());
        //     offlineDatabaseHelper.insertOfflineRequest(request);
        // Log.d("localDatabase", "PRINTING BATTER VALUE " + batteryLevel);
        //     Log.d("localDatabase", "SAVING DATA IN LOCAL DB");


//        ONLINE CODEEEcle

//
        if (isNetworkAvailable()) {
           disableSSLCertificateChecking();

            Log.d(TAG, "api: " + "NETWORK IS AVAILABLE");

            try {
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

                try {
//                    DatabaseHelper dbHelper = new DatabaseHelper(context);

                    // Save data to SQLite
//                    long result = dbHelper.insertLocationData(
//                            String.valueOf(latitude),
//                            String.valueOf(longitude),
//                            LocalDateTime.now().toString(),
//                            String.valueOf(batteryLevel)
//                    );

//                    if (result != -1) {
//                        Log.d("Database", "Data inserted successfully to local");
//                        // dbHelper.logLocationData();
//                    } else {
//                        Log.e("Database", "Failed to insert data to localll");
//                    }
                } catch (Exception e) {
                    Log.e("DatabaseError", "An error occurred while inserting data: " + e.getMessage(), e);
                }


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
        } else {

//             WHEN NETWORK IS NOT AVAILABLE
            Log.d(TAG, "api: " + "NETWORK IS NOT AVAILABLE");

            try {
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

                try {
                    DatabaseHelper dbHelper = new DatabaseHelper(context);

                    // Save data to SQLite
//                    long result = dbHelper.insertLocationData(
//                            String.valueOf(latitude),
//                            String.valueOf(longitude),
//                            LocalDateTime.now().toString(),
//                            String.valueOf(batteryLevel)
//                    );

//                    if (result != -1) {
//                        Log.d("Database", "Data inserted successfully");
//                        // dbHelper.logLocationData();
//                    } else {
//                        Log.e("Database", "Failed to insert data");
//                    }
                } catch (Exception e) {
                    Log.e("DatabaseError", "An error occurred while inserting data: " + e.getMessage(), e);
                }


                // StringRequest request = new StringRequest(
                //         Request.Method.POST, postUrl,  // Replace with your actual endpoint
                //         new Response.Listener<String>() {
                //             @Override
                //             public void onResponse(String response) {
                //                 Log.d("api", "API Response: " + response);
                //                 // Toast.makeText(context, "Response: " + response, Toast.LENGTH_LONG).show();
                //             }
                //         },
                //         new Response.ErrorListener() {
                //             @Override
                //             public void onErrorResponse(VolleyError error) {
                //                 Log.e("api", "API Error: " + error.getMessage(), error);
                //                 // Toast.makeText(context, "Error: " + error.getMessage(), Toast.LENGTH_LONG).show();
                //             }
                //         }) {
                //     @Override
                //     public String getBodyContentType() {
                //         return "application/json; charset=utf-8";
                //     }

                //     @Override
                //     public byte[] getBody() {
                //         return data.toString().getBytes();
                //     }

                //     @Override
                //     public Map<String, String> getHeaders() throws AuthFailureError {
                //         Map<String, String> headers = new HashMap<>();
                //         headers.put("Content-Type", "application/json; charset=utf-8");
                //         if (tokenValue != null) {
                //             headers.put("Authorization", "Bearer " + tokenValue);
                //         }
                //         return headers;
                //     }
                // };

                // Volley.newRequestQueue(context).add(request);
            } catch (JSONException e) {
                // Log.e("api", "Error preparing API request", e);
                // Toast.makeText(context, "Error occurred while preparing API request", Toast.LENGTH_LONG).show();
            }


//            Toast.makeText(context, "No internet connection available", Toast.LENGTH_LONG).show();
        }

//        if (isNetworkAvailable()) {
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
//                StringRequest request = new StringRequest(
//                        Request.Method.POST, postUrl,  // Replace with your actual endpoint
//                        new Response.Listener<String>() {
//                            @Override
//                            public void onResponse(String response) {
//                                // Log.d("api", "API Response: " + response);
//                                // Toast.makeText(context, "Response: " + response, Toast.LENGTH_LONG).show();
//                            }
//                        },
//                        new Response.ErrorListener() {
//                            @Override
//                            public void onErrorResponse(VolleyError error) {
//                                // Log.e("api", "API Error: " + error.getMessage(), error);
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
//                // Log.e("api", "Error preparing API request", e);
//                // Toast.makeText(context, "Error occurred while preparing API request", Toast.LENGTH_LONG).show();
//            }
//        } else {
//            // Log.d("api", "No internet connection available");
//            Toast.makeText(context, "No internet connection available", Toast.LENGTH_LONG).show();
//        }
    }




    public void callDummyApi(double latitude, double longitude) {


        StringRequest request = new StringRequest(
                Request.Method.POST, postUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        // Log.d(TAG, "API Response: " + response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e(TAG, "API Error: " + (error.getMessage() != null ? error.getMessage() : "Timeout Error"), error);
                        Toast.makeText(context, "Error: " + (error.getMessage() != null ? error.getMessage() : "Timeout Error"), Toast.LENGTH_LONG).show();
                    }
                }) {
            @Override
            public String getBodyContentType() {
                return "application/json; charset=utf-8";
            }

            @Override
            public byte[] getBody() {
                return "{}".getBytes(); // Sending an empty JSON object as body
            }
        };

        // Set the retry policy for the request (including timeout duration)
        request.setRetryPolicy(new DefaultRetryPolicy(
                3000, // 30 seconds timeout
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));

        // Add the request to the RequestQueue.
        Volley.newRequestQueue(context).add(request);
    }



    private boolean isNetworkAvailable() {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }
}