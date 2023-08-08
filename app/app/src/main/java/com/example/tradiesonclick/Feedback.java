package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;

import com.google.android.material.textfield.TextInputEditText;

public class Feedback extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feedback);
        ImageButton buttonprofile = findViewById(R.id.imageView510);
        Button submitButton = findViewById(R.id.button7);
        TextInputEditText textView = findViewById(R.id.feedbackText);

        submitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String data = textView.getText().toString();
                SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
                String id = a.getString("id", "");

                FeedbackSubmit fs = new FeedbackSubmit();
                fs.execute(id,data);

            }
        });
        buttonprofile.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vpr) {
                // Create an intent to start the target activity
                Intent intent = new Intent(Feedback.this, MyProfCust.class);


                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });

        ImageButton buttonMyBookings = findViewById(R.id.mybookings_button);
        buttonMyBookings.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vmb) {
                // Create an intent to start the target activity
                Intent intent = new Intent(Feedback.this, MyBookings.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });
        ImageButton buttonNoti = findViewById(R.id.imageView100);
        buttonNoti.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vn) {
                // Create an intent to start the target activity
                Intent intent = new Intent(Feedback.this, Notifications.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });
        ImageButton buttonHome = findViewById(R.id.imageView_home);
        buttonHome.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vh) {
                // Create an intent to start the target activity
                Intent intent = new Intent(Feedback.this, HomeCust.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });

        ImageButton buttonConnect = findViewById(R.id.btn_connect);
        buttonConnect.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View cnt) {
                // Create an intent to start the target activity
                Intent intent = new Intent(Feedback.this, Connect.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });


    }

    public class FeedbackSubmit extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb= new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("Feedback");
            wb.addProperty("id", strings[0]);
            wb.addProperty("data", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(Feedback.this, s, Toast.LENGTH_SHORT).show();
        }


    }



}