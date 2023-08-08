package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class BookingPage extends AppCompatActivity {
    TextView name, address,phone,charge, about;
    String cname[],reviewcontent[],datentime[];
    String Sdid, advance;
    float[] ratings;
    RatingBar ratingBar;
    ImageView propic;
    RecyclerView customerReviews;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_booking_page);

        String tradesmanId = getIntent().getStringExtra("id");
        GetTradesmen g = new GetTradesmen();
        g.execute(tradesmanId);
        name=findViewById(R.id.name_txt);
        address=findViewById(R.id.add_text);
        phone=findViewById(R.id.phone_txt);
        charge=findViewById(R.id.textView33);
        propic=findViewById(R.id.propic);
        ratingBar=findViewById(R.id.star_avg);
        ratingBar.setIsIndicator(true);

        about=findViewById(R.id.textView14);
        customerReviews = findViewById(R.id.customer_reviews);

        Getreviews r = new Getreviews();
        r.execute(tradesmanId);


        Button buttonSendRequest = findViewById(R.id.request_work_button);
        buttonSendRequest .setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vss) {
                // Create an intent to start the target activity
                Intent intent = new Intent(BookingPage.this, Book.class);
                intent.putExtra("sdid",Sdid);
                intent.putExtra("advance",advance);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });
        ImageButton buttonprofile = findViewById(R.id.  imageView510);
        buttonprofile.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vpr) {
                // Create an intent to start the target activity
                Intent intent = new Intent(BookingPage.this, MyProfCust.class);


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
                Intent intent = new Intent(BookingPage.this, Notifications.class);

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
                Intent intent = new Intent(BookingPage.this, MyBookings.class);

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
                Intent intent = new Intent(BookingPage.this, HomeCust.class);

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
                Intent intent = new Intent(BookingPage.this, Connect.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });


    }
    public class GetTradesmen extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("tradieDetails");
            wb.addProperty("id",strings[0]);
            wb.addProperty("ip",WebServiceCaller.ip);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            if (!s.equals("[]")) {
                JSONArray j = null;
                try {
                    j = new JSONArray(s);
                    JSONObject jo = j.getJSONObject(0);


                    String Name = jo.getString("name");
                    String Phone = jo.getString("phone");
                    String Loc = jo.getString("address");
                    String image = jo.getString("photo");
                    String Charge = jo.getString("charge");
                    String About = jo.getString("about");
                    Sdid=jo.getString("sdid");
                    advance=jo.getString("advance");
                    float ratingValue = Float.parseFloat(jo.getString("average_rating"));
                    name.setText(Name);
                    phone.setText(Phone);
                    address.setText(Loc);
                    charge.setText(Charge);
                    ratingBar.setRating(ratingValue);
                    about.setText(About);
                    Picasso.get().load(image).into(propic);



                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }


        }
    }
    public class Getreviews extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller w = new WebServiceCaller(getApplicationContext());
            w.setSoapObject("customerReviews");
            w.addProperty("id",strings[0]);

            w.addProperty("ip",WebServiceCaller.ip);
            w.callWebService();
            return w.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("TAG", s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);

                cname = new String[j.length()];
                datentime = new String[j.length()];
                reviewcontent = new String[j.length()];
                ratings = new float[j.length()];

                //id = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                   cname[i] = jo.getString("name");
                    datentime[i] = jo.getString("dateNtime");
                    reviewcontent[i] = jo.getString("review");
                    ratings[i] = Float.parseFloat(jo.getString("rating"));

                }
                ReviewAdapter myAdapter = new ReviewAdapter(BookingPage.this, cname, datentime, reviewcontent, ratings);
                customerReviews.setAdapter(myAdapter);
                customerReviews.setLayoutManager(new LinearLayoutManager(BookingPage.this));

            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }




}