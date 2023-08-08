package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;

import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;


public class RegistrationCust extends AppCompatActivity {
    String Email, Password, Name, Address, LocalPlace, Phone,Place;
    String id, name;
    ArrayAdapter<String> placeadapter;
    String placeid[], placename[];
    EditText emailR, passwordR, nameR, addressR, phoneR;

    private TextView textView;

    private Spinner localPlaceSpinner;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration_cust);
        localPlaceSpinner = findViewById(R.id.localPlaceSpinner);

        GetPlace g = new GetPlace();
        g.execute();

        emailR = findViewById(R.id.reg_email);
        passwordR = findViewById(R.id.reg_password);
        nameR = findViewById(R.id.reg_name);
        addressR = findViewById(R.id.reg_address);
        phoneR = findViewById(R.id.reg_phone);

        Button buttonReg = findViewById(R.id.button21);
        buttonReg.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View vr) {
                if (validateForm()) {

                    // Perform registration logic here
                    // For simplicity, we'll just show a toast indicating successful registration
                    
                    RegDetails r = new RegDetails();
                    r.execute(Name, Phone, Address, Email, Place, Password);
                } else {
                    Toast.makeText(RegistrationCust.this, "Registration failed!", Toast.LENGTH_SHORT).show();
                }
            }
        });

    }
    private boolean validateForm(){
        Email = emailR.getText().toString();
        Password = passwordR.getText().toString();
        Name = nameR.getText().toString();
        Address = addressR.getText().toString();
        Phone = phoneR.getText().toString();
        int plid = localPlaceSpinner.getSelectedItemPosition();
        Place  = placeid[plid];
        if (Name.isEmpty() || Phone.isEmpty() || Email.isEmpty() || Password.isEmpty() || Password.isEmpty() ||Address.isEmpty()||Place.isEmpty()) {
            Toast.makeText(this, "Please fill in all fields.", Toast.LENGTH_SHORT).show();
            return false;
        }
        if (!isValidEmail(String.valueOf(Email))) {
            Toast.makeText(this, "Please enter a valid email address.", Toast.LENGTH_SHORT).show();

            return false;
        }
        if (!isStrongPassword(String.valueOf(Password))) {
            Toast.makeText(this, "Please enter a strong password. Your password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character (@#$%^&+=!_).", Toast.LENGTH_LONG).show();
            return false;
        }
        return true;
    }
    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }
    private boolean isStrongPassword(String password) {
        // At least 8 characters long, contains at least one uppercase letter,
        // one lowercase letter, one digit, and one special character
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!_])[A-Za-z\\d@#$%^&+=!_]{8,}$";
        Pattern pattern = Pattern.compile(passwordRegex);
        return pattern.matcher(password).matches();
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

            placeadapter = new ArrayAdapter<String>(RegistrationCust.this, android.R.layout.simple_spinner_item, placename);
            placeadapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            localPlaceSpinner.setAdapter(placeadapter);
        }
    }

    public class RegDetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb= new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("registration");


            wb.addProperty("name", strings[0]);
            wb.addProperty("phone", strings[1]);
            wb.addProperty("address", strings[2]);
            wb.addProperty("email", strings[3]);
            wb.addProperty("localplace", strings[4]);
            wb.addProperty("password", strings[5]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            if (s.equals("1")) {
                /*JSONArray j = null;
                try {
                    j = new JSONArray(s);
                    JSONObject jo = j.getJSONObject(0);
                    id = jo.getString("id");
                    name = jo.getString("name");*/

                Toast.makeText(RegistrationCust.this, "success", Toast.LENGTH_SHORT).show();



              /*  } catch (JSONException e) {
                    e.printStackTrace();
                }*/

                Intent i = new Intent(RegistrationCust.this, Login.class);
                startActivity(i);


            }
            else {
                Toast.makeText(RegistrationCust.this, "failed", Toast.LENGTH_SHORT).show();

            }
        }


    }


}

