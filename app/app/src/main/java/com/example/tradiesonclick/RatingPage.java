package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RatingBar;
import android.widget.Toast;

public class RatingPage extends AppCompatActivity {
    String name, content, id;
    String ratingString;
    EditText nameR, reviewR;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rating_page);

        nameR = findViewById(R.id.Title);
        reviewR = findViewById(R.id.review_content);

        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        id = a.getString("id", "");
        String tradesmanId = getIntent().getStringExtra("tid");

        RatingBar ratingBar = findViewById(R.id.ratingBar);
        ratingBar.setOnRatingBarChangeListener(new RatingBar.OnRatingBarChangeListener() {
            @Override
            public void onRatingChanged(RatingBar ratingBar, float rating, boolean fromUser) {
                // Here, 'rating' is the number of stars selected as a float value
                int numberOfStars = (int) rating;
                ratingString = String.valueOf(numberOfStars);
            }
        });


        Button giveREVIEW = findViewById(R.id.review_button);
        giveREVIEW.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (validateForm()) {
                    GiveReview gr = new GiveReview();
                    gr.execute(name, content, ratingString, id, tradesmanId);
                } else {
                    Toast.makeText(RatingPage.this, "Rating failed!", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private boolean validateForm(){
                    name = nameR.getText().toString();
                content = reviewR.getText().toString();
        if (name.isEmpty() || content.isEmpty() || ratingString.isEmpty()) {
            Toast.makeText(this, "Please fill in all fields.", Toast.LENGTH_SHORT).show();
            return false;
        }

return  true;
            }



    public class GiveReview extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("reviewFromCustomers");
            wb.addProperty("id", strings[3]);
            wb.addProperty("username", strings[0]);
            wb.addProperty("reviewContent", strings[1]);
            wb.addProperty("rating", strings[2]);
            wb.addProperty("tid", strings[4]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(RatingPage.this, s, Toast.LENGTH_SHORT).show();
            Intent i = new Intent(RatingPage.this, MyBookings.class);
            startActivity(i);
        }


    }
}