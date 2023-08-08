package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class RegType extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reg_type);


        Button buttonRC = findViewById(R.id.buttonRegCu);
        buttonRC.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v3) {
                // Create an intent to start the target activity
                Intent intent = new Intent(RegType.this, RegistrationCust.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });

        Button buttontm = findViewById(R.id.buttonRegTm);
        buttontm.setOnClickListener(new View.OnClickListener(){
        @Override
        public void onClick(View v4) {
            // Create an intent to start the target activity
            Intent intent = new Intent(RegType.this, RegistrationTm.class);

            // You can pass data to the target activity using intent extras
            //intent.putExtra("key", value);

            // Start the target activity
            startActivity(intent);
        }
    });

    }
}