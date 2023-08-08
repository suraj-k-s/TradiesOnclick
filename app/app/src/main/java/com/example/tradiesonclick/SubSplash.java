package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class SubSplash extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub_splash);



        Button button = findViewById(R.id.buttonForRegister);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v1) {
                // Create an intent to start the target activity
                Intent intent = new Intent(SubSplash.this, RegistrationCust.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });


    Button buttonl = findViewById(R.id.buttonLogin);
buttonl.setOnClickListener(new View.OnClickListener(){
        @Override
        public void onClick(View v2) {
            // Create an intent to start the target activity
            Intent intent = new Intent(SubSplash.this, Login.class);

            // You can pass data to the target activity using intent extras
            //intent.putExtra("key", value);

            // Start the target activity
            startActivity(intent);
        }
    });

}
}