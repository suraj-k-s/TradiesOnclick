package com.example.tradiesonclick;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.view.MenuItem;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;



import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MyProfCust extends AppCompatActivity {
    TextView name,email,phone,address,startdate,localplace;

    Button btnclose;
    AlertDialog.Builder builder;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_prof_cust);

        btnclose = findViewById(R.id.logout);
        builder= new AlertDialog.Builder(this);
        btnclose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                builder.setTitle("Logout!!")
                        .setMessage("Are you sure you want to logout?")
                        .setCancelable(true)
                        .setPositiveButton("yes", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                Intent intent = new Intent(MyProfCust.this, Login.class);
                                startActivity(intent);
                                finish();
                            }
                        })
                        .setNegativeButton("No", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                dialogInterface.cancel();
                            }
                        })
                        .show();
            }
        });

        ImageButton buttonprofile = findViewById(R.id.  imageView510);
        buttonprofile.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vpr) {
                // Create an intent to start the target activity
                Intent intent = new Intent(MyProfCust.this, MyProfCust.class);


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
                Intent intent = new Intent(MyProfCust.this, Notifications.class);

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
                Intent intent = new Intent(MyProfCust.this, MyBookings.class);

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
                Intent intent = new Intent(MyProfCust.this, HomeCust.class);

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
                Intent intent = new Intent(MyProfCust.this, Connect.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });
       Button buttonedit = findViewById(R.id.button2);
        buttonedit.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View cnt) {
                // Create an intent to start the target activity
                Intent intent = new Intent(MyProfCust.this, EditProfile.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });


//        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        name = findViewById(R.id.name_pro);
        email = findViewById(R.id.email_text);
        phone = findViewById(R.id.date_txt);
        address = findViewById(R.id.address_txt);
        startdate=findViewById(R.id.phone_txt);
        localplace=findViewById(R.id.local_place_pro);


        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

      myprofile s=new myprofile();
        s.execute(id);
    }
    public class myprofile extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb= new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("myprofile");


            wb.addProperty("id", strings[0]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("Profile", s);

            if (!s.equals("[]")) {
                JSONArray j = null;
                try {
                    j = new JSONArray(s);
                    JSONObject jo = j.getJSONObject(0);


                    String Name = jo.getString("name");
                    String Email = jo.getString("email");
                    String Phone = jo.getString("phone");
                    String Loc = jo.getString("address");
                    String  Local=jo.getString("place");
                    String  AccStart=jo.getString("accStartDate");

                    name.setText(Name);
                    email.setText(Email);
                    phone.setText(Phone);
                    address.setText(Loc);
                    localplace.setText(Local);
                    startdate.setText(AccStart);


                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }



        }

    }



}