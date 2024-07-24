package com.example.srinivasa_crm_new;


import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
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

public class ApiClass {
    private  Context context;

    private String url = "https://reqres.in/api/login"; // Replace with your actual API URL
     private String postUrl = "http://65.109.229.140:8080/crmsfpl/se/locations";
//    private String postUrl = "http://192.168.1.45:8080/crmsfpl/se/locations";
    private String TAG = "ApiCaller"; // Tag for logging
    private LocationHelperClass locationHelperClass;

    public ApiClass(Context context) {
        this.context = context;

    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    public void callAPI(double latitude, double longitude) {
        Log.d(TAG, "api: " + latitude + ", longitude: " + longitude);

        if (isNetworkAvailable()) {
            try {
                SharedPreferences sharedPreferences = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
                String tokenValue = sharedPreferences.getString("flutter.token", null);
                String userIdValue = sharedPreferences.getString("flutter.userId", null);
                Log.d(TAG, "api printing tokenValue: " + tokenValue);
                Log.d(TAG, "api printing userIdValue: " + userIdValue);

                JSONObject data = new JSONObject();
                data.put("latitude", latitude);
                data.put("longitude", longitude);
                data.put("userDateTime", LocalDateTime.now().toString());
                StringRequest request = new StringRequest(
                        Request.Method.POST, postUrl,  // Replace with your actual endpoint
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Log.d("api", "API Response: " + response);
                                // Toast.makeText(context, "Response: " + response, Toast.LENGTH_LONG).show();
                            }
                        },
                        new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.e("api", "API Error: " + error.getMessage(), error);
                                Toast.makeText(context, "Error: " + error.getMessage(), Toast.LENGTH_LONG).show();
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
            Log.d("api", "No internet connection available");
            Toast.makeText(context, "No internet connection available", Toast.LENGTH_LONG).show();
        }
    }




    public void callDummyApi(double latitude, double longitude) {


        StringRequest request = new StringRequest(
                Request.Method.POST, postUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.d(TAG, "API Response: " + response);
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