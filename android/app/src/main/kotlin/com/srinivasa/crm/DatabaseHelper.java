package com.srinivasa.crm;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class DatabaseHelper extends SQLiteOpenHelper {

    private static final String DATABASE_NAME = "location_data.db";
    private static final int DATABASE_VERSION = 1;
    private static final String TABLE_NAME = "location";
    private static final String COLUMN_ID = "id";
    private static final String COLUMN_LATITUDE = "latitude";
    private static final String COLUMN_LONGITUDE = "longitude";
    private static final String COLUMN_USER_DATE_TIME = "userDateTime";
    private static final String COLUMN_BATTERY_STATUS = "batteryStatus";

    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String createTableQuery = "CREATE TABLE " + TABLE_NAME + " (" +
                COLUMN_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                COLUMN_LATITUDE + " TEXT, " +
                COLUMN_LONGITUDE + " TEXT, " +
                COLUMN_USER_DATE_TIME + " TEXT, " +
                COLUMN_BATTERY_STATUS + " TEXT)";
        db.execSQL(createTableQuery);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }

    public long insertLocationData(String latitude, String longitude, String userDateTime, String batteryStatus) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put(COLUMN_LATITUDE, latitude);
        contentValues.put(COLUMN_LONGITUDE, longitude);
        contentValues.put(COLUMN_USER_DATE_TIME, userDateTime);
        contentValues.put(COLUMN_BATTERY_STATUS, batteryStatus);

        return db.insert(TABLE_NAME, null, contentValues);
    }

    

    public Cursor getAllLocationData() {
        SQLiteDatabase db = this.getReadableDatabase();
        return db.rawQuery("SELECT * FROM " + TABLE_NAME, null);
    }

    public void logLocationData() {
        Cursor cursor = getAllLocationData(); // Fetch all location data
        if (cursor != null) {
            try {
                if (cursor.moveToFirst()) { // Ensure the cursor starts from the first row
                    JSONArray jsonArray = new JSONArray();

                    do {
                        // Extract each column value
                        String latitude = cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_LATITUDE));
                        String longitude = cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_LONGITUDE));
                        String userDateTime = cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_USER_DATE_TIME));

                        // Create a JSON object for the current record
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("latitude", latitude);
                        jsonObject.put("longitude", longitude);
                        jsonObject.put("userDateTime", userDateTime);

                        // Add the JSON object to the JSON array
                        jsonArray.put(jsonObject);

                    } while (cursor.moveToNext()); // Move to the next row

                    // Log the JSON array
                    Log.d("LocationData", jsonArray.toString());
                } else {
                    Log.d("LocationData", "No data found in the database.");
                }
            } catch (Exception e) {
                Log.e("DatabaseHelper", "Error processing cursor data", e);
            } finally {
                // Always close the cursor to prevent memory leaks
                cursor.close();
            }
        } else {
            Log.d("LocationData", "Cursor is null.");
        }
    }



    public JSONArray getLocationDataFromDatabase() {
        SQLiteDatabase db = this.getReadableDatabase();
        JSONArray jsonArray = new JSONArray();
        Cursor cursor = null;
        try {
            cursor = db.rawQuery("SELECT * FROM location", null);
            if (cursor.moveToFirst()) {
                do {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("latitude", cursor.getString(cursor.getColumnIndexOrThrow("latitude")));
                    jsonObject.put("longitude", cursor.getString(cursor.getColumnIndexOrThrow("longitude")));
                    jsonObject.put("userDateTime", cursor.getString(cursor.getColumnIndexOrThrow("userDateTime")));
                    jsonArray.put(jsonObject);
                } while (cursor.moveToNext());
            }
        } catch (JSONException e) {
            throw new RuntimeException(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        return jsonArray;
    }


    // Delete function to delete rows based on conditions or all rows
    public int deleteLocationData(String conditionColumn, String conditionValue) {
        SQLiteDatabase db = this.getWritableDatabase();
        return db.delete(TABLE_NAME, conditionColumn + "=?", new String[]{conditionValue});
    }

    // Delete all data from the table
    public void deleteAllLocationData() {
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_NAME, null, null); // Pass null to delete all rows
        Log.d("DatabaseHelper", "All location data deleted.");
    }
}



