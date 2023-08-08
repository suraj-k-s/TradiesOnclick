package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Notifications extends AppCompatActivity {

    String date[],title[],content[];
    RecyclerView recyclerView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notifications);
        recyclerView = findViewById(R.id.notificationView);

        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");
        GetNotification gn = new GetNotification();
        gn.execute(id);
    }
    public class GetNotification extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("Notification");
            wb.addProperty("id",strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute(String s) {
            Log.d("TAG", s);
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                date = new String[j.length()];
                title = new String[j.length()];
                content = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    date[i] = jo.getString("date");
                    title[i] = jo.getString("title");
                    content[i] = jo.getString("content");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            NotificationAdapter notificationAdapter = new NotificationAdapter(Notifications.this,title,date,content);
            recyclerView.setAdapter(notificationAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(Notifications.this));
        }
    }
}