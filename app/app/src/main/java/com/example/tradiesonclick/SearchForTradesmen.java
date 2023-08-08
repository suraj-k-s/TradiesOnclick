package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SearchForTradesmen extends AppCompatActivity {
    ArrayAdapter<String> placeadapter, serviceadapter;
    String placeid[], placename[], serviceid[],servicename[];
    String placeId="" ,serviceId="";


    String image[],name[],type[],charge[],id[],sdid[];

    RecyclerView tradesmenSearch;

    private Spinner localPlaceSpinner,servicetypeSpinner;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search_for_tradesmen);
        localPlaceSpinner = findViewById(R.id.local_place_spinner);
        servicetypeSpinner = findViewById(R.id.service_type_spinner);
        tradesmenSearch = findViewById(R.id.TradesmenSearch);
       SearchForTradesmen.GetPlace g = new SearchForTradesmen.GetPlace();
        g.execute();
        SearchForTradesmen.GetService st = new SearchForTradesmen.GetService();
        st.execute();



        localPlaceSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

                placeId = placeid[position];
                serviceId =serviceid[servicetypeSpinner.getSelectedItemPosition()];
                GetTradesmen t = new GetTradesmen();
                t.execute(placeId,serviceId);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });

        servicetypeSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

                serviceId = serviceid[position];
                placeId =placeid[localPlaceSpinner.getSelectedItemPosition()];
                GetTradesmen t = new GetTradesmen();
                t.execute(placeId,serviceId);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });





        ImageButton buttonBackToHome = findViewById(R.id.imageView_home);
        buttonBackToHome.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vbth) {
                // Create an intent to start the target activity
                Intent intent = new Intent(SearchForTradesmen.this, HomeCust.class);

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
                Intent intent = new Intent(SearchForTradesmen.this, MyProfCust.class);


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
                Intent intent = new Intent(SearchForTradesmen.this, MyBookings.class);

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
                Intent intent = new Intent(SearchForTradesmen.this, HomeCust.class);

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
                Intent intent = new Intent(SearchForTradesmen.this, Connect.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });


    }
    public class GetPlace extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("selectLocalPlace");
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                placeid = new String[j.length() + 1];
                placename = new String[j.length() + 1];
                placename[0] = "--Select--";
                placeid[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    placeid[i + 1] = jo.getString("pid");
                    placename[i + 1] = jo.getString("pname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            placeadapter = new ArrayAdapter<String>(SearchForTradesmen.this, android.R.layout.simple_spinner_item, placename);
            placeadapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            localPlaceSpinner.setAdapter(placeadapter);
        }
    }


    public class GetService extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller st= new WebServiceCaller(getApplicationContext());
            st.setSoapObject("selectServiceType");

            st.callWebService();
            return st.getResponse();
        }

        @Override
        protected void onPostExecute(String st) {
            super.onPostExecute(st);
            JSONArray j = null;
            try {
                j = new JSONArray(st);
                serviceid = new String[j.length() + 1];
                servicename = new String[j.length() + 1];
               servicename[0] = "--Select--";
               serviceid[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    serviceid[i + 1] = jo.getString("sid");
                    servicename[i + 1] = jo.getString("sname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            serviceadapter = new ArrayAdapter<String>(SearchForTradesmen.this, android.R.layout.simple_spinner_item, servicename);
            serviceadapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            servicetypeSpinner.setAdapter(serviceadapter);
        }
    }

    public class GetTradesmen extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("searchResultTM");
            wb.addProperty("localplaceid",strings[0]);
            wb.addProperty("servicetypeid",strings[1]);
            wb.addProperty("ip",WebServiceCaller.ip);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("Data", s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                image = new String[j.length()];
                name = new String[j.length()];
                type = new String[j.length()];
                charge = new String[j.length()];
                id = new String[j.length()];

                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    type[i] = jo.getString("servicetype");
                    image[i] = jo.getString("photo");
                    charge[i] = jo.getString("charge");
                    name[i] = jo.getString("name");
                    id[i] = jo.getString("id");


                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            VPAdapter myAdapter = new VPAdapter(SearchForTradesmen.this,image,name,type,charge,id);
            tradesmenSearch.setAdapter(myAdapter);
            tradesmenSearch.setLayoutManager(new LinearLayoutManager(SearchForTradesmen.this));
        }
    }


}