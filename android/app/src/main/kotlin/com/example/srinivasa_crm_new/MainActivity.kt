package com.example.srinivasa_crm_new

import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.example.srinivasa_crm_new"
    
    private var serviceIntent: Intent? = null
    private lateinit var locationHelper: LocationHelperClass


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        locationHelper = LocationHelperClass(this);
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Log.d("MainActivity", "Configuring Flutter Engine")

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            Log.d("MainActivity", "Method call received: ${call.method}")
            when (call.method) {
                "start" -> {

//                    if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION)
//                        != PackageManager.PERMISSION_GRANTED) {
//                        ActivityCompat.requestPermissions(this, arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION), 1)
//                    } else {
////                        locationHelper.getLatLongValues()
//                        startCustomService();
//                    }
//                    result.success(null)

                    if (checkAndRequestPermissions()) {
                        startCustomService()
                        result.success("Service started")
                    } else {
                        result.error("PERMISSION_DENIED", "Location permission denied", null)
                    }

                }
                "stop" -> {
                    stopCustomService()
                    result.success(null)
                }
                "location" -> {
                    getLocation()
                    result.success(null)
                }
                "api" -> {
                    callDummyLocationApi()
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }


    //    CHECKING ALL THE PERMISSIONS
    private fun checkAndRequestPermissions(): Boolean {
        val permissions = arrayOf(
            android.Manifest.permission.ACCESS_COARSE_LOCATION,
            android.Manifest.permission.FOREGROUND_SERVICE,
            android.Manifest.permission.ACCESS_FINE_LOCATION,
            android.Manifest.permission.FOREGROUND_SERVICE_LOCATION
        )

        val permissionsNeeded = permissions.filter {
            ContextCompat.checkSelfPermission(this, it) != PackageManager.PERMISSION_GRANTED
        }

        return if (permissionsNeeded.isNotEmpty()) {
            ActivityCompat.requestPermissions(this, permissionsNeeded.toTypedArray(), 1)
            false
        } else {
            true
        }
    }

    private fun startCustomService() {
        Log.d("MainActivity", "Starting custom service")
        serviceIntent = Intent(this, CustomService::class.java)
        startService(serviceIntent)
    }

    private fun stopCustomService() {
        Log.d("MainActivity", "Stopping custom service")
        if (serviceIntent != null) {
            stopService(serviceIntent)
            serviceIntent = null
        }
    }

    private fun getLocation() {
        Log.d("MainActivity", "Getting location")
        Log.d("MainActivity", "Getting location")
        locationHelper.getLatLongValues();

    }

    private fun callDummyLocationApi() {
        var apiClass = ApiClass(this);
        apiClass.callAPI(0.0,0.8);
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        Log.d("MainActivity", "Permissions result received")
        if (requestCode == 1 && grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
            getLocation()
        } else {
            Toast.makeText(this, "Permission denied", Toast.LENGTH_SHORT).show()
        }
    }
}
