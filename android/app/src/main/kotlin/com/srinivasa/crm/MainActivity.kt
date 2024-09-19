
package com.srinivasa.crm;

import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AlertDialog
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.srinivasa.crm"

    private var serviceIntent: Intent? = null
    private lateinit var locationHelper: LocationHelperClass


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        locationHelper = LocationHelperClass(this);
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Log.d("MainActivity", "Configuring Flutter Engine")

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
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

                    if (if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            checkAndRequestPermissions()
                        } else {
                            TODO("VERSION.SDK_INT < M")
                        }
                    ) {
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
//    private fun checkAndRequestPermissions(): Boolean {
//        val permissions = arrayOf(
//            android.Manifest.permission.ACCESS_COARSE_LOCATION,
//            android.Manifest.permission.FOREGROUND_SERVICE,
//            android.Manifest.permission.ACCESS_FINE_LOCATION,
//            android.Manifest.permission.FOREGROUND_SERVICE_LOCATION,
//            android.Manifest.permission.INTERNET,
//            android.Manifest.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
//            android.Manifest.permission.WRITE_EXTERNAL_STORAGE,
//            android.Manifest.permission.READ_EXTERNAL_STORAGE,
//        )
//
//        val permissionsNeeded = permissions.filter {
//            ContextCompat.checkSelfPermission(this, it) != PackageManager.PERMISSION_GRANTED
//        }
//
//        return if (permissionsNeeded.isNotEmpty()) {
//            ActivityCompat.requestPermissions(this, permissionsNeeded.toTypedArray(), 1)
//            false
//        } else {
//            true
//        }
//    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun checkAndRequestPermissions(): Boolean {
        val permissions = arrayOf(
            android.Manifest.permission.ACCESS_COARSE_LOCATION,
            android.Manifest.permission.ACCESS_FINE_LOCATION,
//            android.Manifest.permission.FOREGROUND_SERVICE,
            android.Manifest.permission.INTERNET,
            android.Manifest.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
//            android.Manifest.permission.WRITE_EXTERNAL_STORAGE,
//            android.Manifest.permission.READ_EXTERNAL_STORAGE,
        )

        val permissionsNeeded = permissions.filter {
            ContextCompat.checkSelfPermission(this, it) != PackageManager.PERMISSION_GRANTED
        }

        return if (permissionsNeeded.isNotEmpty()) {
            Log.d("MainActivity", "Requesting permissions: ${permissionsNeeded.joinToString()}")
            ActivityCompat.requestPermissions(this, permissionsNeeded.toTypedArray(), 1)
            false
        } else {
            Log.d("MainActivity", "All permissions already granted")
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
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            apiClass.callAPI(0.0, 0.8)
        };
    }

//    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
//        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
//        Log.d("MainActivity", "Permissions result received")
//        if (requestCode == 1 && grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//            getLocation()
//        } else {
//            Toast.makeText(this, "Permission denied", Toast.LENGTH_SHORT).show()
//        }
//    }


    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        Log.d("MainActivity", "Permissions result received: requestCode=$requestCode")

        if (requestCode == 1) {
            var allPermissionsGranted = true

            for (i in permissions.indices) {
                if (grantResults[i] != PackageManager.PERMISSION_GRANTED) {
                    allPermissionsGranted = false
                    Log.w("MainActivity", "Permission denied: ${permissions[i]}")

                    if (ActivityCompat.shouldShowRequestPermissionRationale(this, permissions[i])) {
                        // Show a custom dialog explaining why the permission is needed
                        Log.d("MainActivity", "Showing rationale for: ${permissions[i]}")
                        showPermissionExplanationDialog(permissions[i])
                    } else {
                        // If permissions are denied and user selected "Don't ask again"
                        Log.e("MainActivity", "Permission ${permissions[i]} denied permanently")
                        Toast.makeText(
                            this,
                            "Permission ${permissions[i]} is critical and denied.",
                            Toast.LENGTH_LONG
                        ).show()
                    }
                } else {
                    Log.d("MainActivity", "Permission granted: ${permissions[i]}")
                }
            }

            if (allPermissionsGranted) {
                Log.d("MainActivity", "All requested permissions granted")
                getLocation()
            } else {
                Log.w("MainActivity", "Not all permissions were granted")
            }
        }
    }

    private fun showPermissionExplanationDialog(permission: String) {
        Log.d("MainActivity", "Showing explanation dialog for: $permission")
        AlertDialog.Builder(this)
            .setTitle("Permission Required")
            .setMessage("This app needs $permission to function properly. Please grant the permission.")
            .setPositiveButton("OK") { dialog, _ ->
                dialog.dismiss()
                Log.d("MainActivity", "Requesting permission again for: $permission")
                ActivityCompat.requestPermissions(this, arrayOf(permission), 1)
            }
            .setNegativeButton("Cancel") { dialog, _ ->
                dialog.dismiss()
                Log.w("MainActivity", "User denied permission: $permission")
                Toast.makeText(
                    this,
                    "$permission is critical for app functionality.",
                    Toast.LENGTH_SHORT
                ).show()
            }
            .show()
    }
}
