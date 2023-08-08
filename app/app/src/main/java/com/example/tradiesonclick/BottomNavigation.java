package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;

public class BottomNavigation extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bottom_navigation);

        ImageButton buttonprofile = findViewById(R.id.  imageView510);
        buttonprofile.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vpr) {
                // Create an intent to start the target activity
                Intent intent = new Intent(BottomNavigation.this, MyProfCust.class);


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
                Intent intent = new Intent(BottomNavigation.this, MyBookings.class);

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
                Intent intent = new Intent(BottomNavigation.this, HomeCust.class);

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
                Intent intent = new Intent(BottomNavigation.this, Connect.class);

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
                Intent intent = new Intent(BottomNavigation.this, Notifications.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });

    }
}