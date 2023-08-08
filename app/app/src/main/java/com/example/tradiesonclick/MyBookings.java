package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager2.widget.ViewPager2;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;

import com.example.tradiesonclick.fragments.Active;
import com.example.tradiesonclick.fragments.ActiveAdapter;
import com.example.tradiesonclick.fragments.History;
import com.example.tradiesonclick.fragments.Rejected;
import com.google.android.material.tabs.TabLayout;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MyBookings extends AppCompatActivity implements OnCancelClickListener{
    TabLayout tabLayout;
    ViewPager2 viewPager2;

    MyViewPagerAdapter myViewPagerAdapter;
    String name[],type[],bdate[],fordate[],phone[],bid[], requeststat[],workstat[],paystat[],tid[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_bookings);
        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");
        GetBoookings gb=new GetBoookings();
        gb.execute(id);


        tabLayout = findViewById(R.id.tablayout1);
        viewPager2 = findViewById(R.id.viewpagerbookings);


        tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                viewPager2.setCurrentItem(tab.getPosition());
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });

        viewPager2.registerOnPageChangeCallback(new ViewPager2.OnPageChangeCallback() {
            @Override
            public void onPageSelected(int position) {
                super.onPageSelected(position);
                tabLayout.getTabAt(position).select();
            }
        });
        ImageButton buttonprofile = findViewById(R.id.imageView510);
        buttonprofile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View vpr) {
                // Create an intent to start the target activity
                Intent intent = new Intent(MyBookings.this, MyProfCust.class);


                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });

        ImageButton buttonMyBookings = findViewById(R.id.mybookings_button);
        buttonMyBookings.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View vmb) {
                // Create an intent to start the target activity
                Intent intent = new Intent(MyBookings.this, MyBookings.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });
        ImageButton buttonHome = findViewById(R.id.imageView_home);
        buttonHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View vh) {
                // Create an intent to start the target activity
                Intent intent = new Intent(MyBookings.this, HomeCust.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });

        ImageButton buttonConnect = findViewById(R.id.btn_connect);
        buttonConnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View cnt) {
                // Create an intent to start the target activity
                Intent intent = new Intent(MyBookings.this, Connect.class);

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
                Intent intent = new Intent(MyBookings.this, Notifications.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });

    }
    @Override
    public void onCancelClick(String bid) {

        Log.d("MyBookings", "onCancelClick called with bid: " + bid);

        ServiceCancel serviceCancel = new ServiceCancel();
        serviceCancel.execute(bid);
    }


    public class GetBoookings extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("myBookings");
            wb.addProperty("id", strings[0]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);


            JSONArray j = null;
            try {
                j = new JSONArray(s);
                name = new String[j.length()];
                type = new String[j.length()];
                bdate = new String[j.length()];
                fordate = new String[j.length()];
                phone = new String[j.length()];
                bid = new String[j.length()];
                requeststat=new String[j.length()];
                workstat=new String[j.length()];
                paystat=new String[j.length()];
                tid=new String[j.length()];


                ArrayList<Bundle> activeBookings = new ArrayList<>();
                ArrayList<Bundle> rejectedBookings = new ArrayList<>();
                ArrayList<Bundle> historyBookings = new ArrayList<>();



                for (int i = 0; i < j.length(); i++) {

                    JSONObject jo = j.getJSONObject(i);
                    Bundle bookingDetails = new Bundle();
                    bookingDetails.putString("bid",jo.getString("bid"));
                    bookingDetails.putString("name", jo.getString("name"));
                    bookingDetails.putString("phone", jo.getString("phone"));
                    bookingDetails.putString("bdate", jo.getString("bdate"));
                    bookingDetails.putString("fdate", jo.getString("fdate"));
                    bookingDetails.putString("serivce", jo.getString("serivce"));
                    bookingDetails.putString("rstatus", jo.getString("rstatus"));
                    bookingDetails.putString("wstatus",jo.getString("wstatus"));
                    bookingDetails.putString("pstatus", jo.getString("pstatus"));
                     bookingDetails.putString("tid", jo.getString("tid"));
                    if ("1".equals(jo.getString("wstatus"))) {
                        historyBookings.add(bookingDetails);

                    }
                    else if ("0".equals(jo.getString("rstatus")) || "1".equals(jo.getString("rstatus"))) {
                        activeBookings.add(bookingDetails);


                    } else if ("2".equals(jo.getString("rstatus"))) {
                        rejectedBookings.add(bookingDetails);
                    }

                }

                    MyViewPagerAdapter myViewPagerAdapter = new MyViewPagerAdapter(MyBookings.this, activeBookings,rejectedBookings,historyBookings);
                myViewPagerAdapter.setOnCancelClickListener(MyBookings.this);

                viewPager2.setAdapter(myViewPagerAdapter);

            } catch (JSONException e) {
                e.printStackTrace();
            }

        }
    }
    public class ServiceCancel extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("CancelRequest");
            wb.addProperty("id", strings[0]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            Toast.makeText(MyBookings.this, s, Toast.LENGTH_SHORT).show();
            SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
            String id = a.getString("id", "");
            GetBoookings gb=new GetBoookings();
            gb.execute(id);
        }
    }

}