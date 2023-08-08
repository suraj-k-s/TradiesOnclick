package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Calendar;

public class Book extends AppCompatActivity {
    String cdate ,cdetails, ctodate,cstarttime,cadvanceamount;
    String gadvance;
    TextInputEditText date,todate,starttime,details,advance;
    private TextInputLayout textInputLayout,textInputLayoutto;
    private TextInputEditText dateSelectEditText,todateSelectedEditText;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_book);
        advance=findViewById(R.id.advance);


        String tradesmanId = getIntent().getStringExtra("id");

        String sdetailsId = getIntent().getStringExtra("sdid");
        String Advance = getIntent().getStringExtra("advance");


        advance.setText(Advance);


        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");





        date=findViewById(R.id.date_select);
        todate=findViewById(R.id.todate_select);
        starttime=findViewById(R.id.starttime_select);


        details=findViewById(R.id.details_txt);

        ImageButton buttonprofile = findViewById(R.id.  imageView510);
        buttonprofile.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View vpr) {
                // Create an intent to start the target activity
                Intent intent = new Intent(Book.this, MyProfCust.class);


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
                Intent intent = new Intent(Book.this, MyBookings.class);

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
                Intent intent = new Intent(Book.this, Notifications.class);

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
                Intent intent = new Intent(Book.this, HomeCust.class);

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
                Intent intent = new Intent(Book.this, Connect.class);

                // You can pass data to the target activity using intent extras
                //intent.putExtra("key", value);

                // Start the target activity
                startActivity(intent);
            }
        });

        Button bookButton=findViewById(R.id.button5);
        bookButton.setOnClickListener(new View.OnClickListener() {
        @Override
        public void onClick(View v) {

            if (validateForm()) {

                // Perform registration logic here
                // For simplicity, we'll just show a toast indicating successful registration
                Toast.makeText(Book.this, "Booked! Wait for Confirmation!", Toast.LENGTH_SHORT).show();
                BookWork e = new BookWork();
                e.execute(id, sdetailsId, cdate, cdetails, gadvance, ctodate, cstarttime);
            }else {
                Toast.makeText(Book.this, "Booking failed!", Toast.LENGTH_SHORT).show();
            }
        }
        });

        textInputLayout = findViewById(R.id.textInputLayout);
        dateSelectEditText = findViewById(R.id.date_select);

        dateSelectEditText.setFocusable(false);
        dateSelectEditText.setClickable(true);

        dateSelectEditText.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDatePickerDialog();
            }
        });

        textInputLayoutto = findViewById(R.id.textInputLayoutto);
        todateSelectedEditText = findViewById(R.id.todate_select);

        todateSelectedEditText.setFocusable(false);
        todateSelectedEditText.setClickable(true);

        todateSelectedEditText.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View vt) {
                showDatePickerDialog1();
            }
        });




    }
    private boolean validateForm(){
        cdate = date.getText().toString();
        cdetails= details.getText().toString();
        cstarttime= starttime.getText().toString();
        ctodate= todate.getText().toString();
        gadvance = advance.getText().toString();
        if (cdate.isEmpty() || cdetails.isEmpty() || cstarttime.isEmpty() || ctodate.isEmpty() ) {
            Toast.makeText(this, "Please fill in all fields.", Toast.LENGTH_SHORT).show();
            return false;
        }

return true;


    }

    private void showDatePickerDialog1() {
        // Get the current date
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        // Calculate the maximum date (10 years from today)
        Calendar maxDate = Calendar.getInstance();
        maxDate.add(Calendar.YEAR, 100);

        // Create a DatePickerDialog and show it
        DatePickerDialog datePickerDialog = new DatePickerDialog(this, new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                // Here, you get the selected date
                String selectedDate = dayOfMonth + "/" + (month + 1) + "/" + year;
                // Set the selected date to the TextInputEditText
                todateSelectedEditText.setText(selectedDate);
            }
        }, year, month, day);

        // Set the maximum date to 10 years from today
        datePickerDialog.getDatePicker().setMaxDate(maxDate.getTimeInMillis());

        datePickerDialog.show();
    }
    private void showDatePickerDialog() {
        // Get the current date
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        // Calculate the maximum date (10 years from today)
        Calendar maxDate = Calendar.getInstance();
        maxDate.add(Calendar.YEAR, 100);

        // Create a DatePickerDialog and show it
        DatePickerDialog datePickerDialog = new DatePickerDialog(this, new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                // Here, you get the selected date
                String selectedDate = dayOfMonth + "/" + (month + 1) + "/" + year;
                // Set the selected date to the TextInputEditText
                dateSelectEditText.setText(selectedDate);
            }
        }, year, month, day);

        // Set the maximum date to 10 years from today
        datePickerDialog.getDatePicker().setMaxDate(maxDate.getTimeInMillis());

        datePickerDialog.show();
    }


    public   class BookWork extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller=new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("bookWork");
            caller.addProperty("id",params[0]);
            caller.addProperty("sdid",params[1]);
            caller.addProperty("fordate",params[2]);
            caller.addProperty("details",params[3]);
            caller.addProperty("advance",params[4]);
            caller.addProperty("todate",params[5]);
            caller.addProperty("starttime",params[6]);


            caller.callWebService();
            String res= caller.getResponse();
            return res;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);


            // Log.d("hai", result);
            if(result.equals("Success")){
                Toast.makeText(getApplicationContext(), "Work Requested. Wait for confirmation", Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(getApplicationContext(),HomeCust.class);
                startActivity(intent);
            }
            else{
                Toast.makeText(getApplicationContext(), "Booking Failed", Toast.LENGTH_SHORT).show();
            }

        }

    }



}