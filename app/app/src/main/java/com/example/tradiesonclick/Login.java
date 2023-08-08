package com.example.tradiesonclick;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.regex.Pattern;


public class Login extends AppCompatActivity {

    String Email,Password;
    String id,name;

    EditText emailT,passwordT;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);

        setContentView(R.layout.activity_login);

        emailT = findViewById(R.id.username);
        passwordT = findViewById(R.id.password);
        Button buttonGo = findViewById(R.id.buttonGo);

        Button buttonNext = findViewById(R.id.buttonRegister);
        buttonNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Login.this, RegistrationCust.class);
                startActivity(intent);
            }
        });

        buttonGo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View vg) {
                if (validateForm()) {

                    LoginDetails l = new LoginDetails();
                    l.execute(Email, Password);

                }else {
                    Toast.makeText(Login.this, "failed!", Toast.LENGTH_SHORT).show();
                }

//                /Email ="aleenamathewur@gmail.com";
////                Password = "all";


            }
        });


    }

    private boolean validateForm(){
        Email = emailT.getText().toString();
        Password = passwordT.getText().toString();
        if ( Email.isEmpty() || Password.isEmpty() ) {
            Toast.makeText(this, "Please enter your email and password .", Toast.LENGTH_SHORT).show();
            return false;
        }
        if (!isValidEmail(String.valueOf(Email))) {
            Toast.makeText(this, "Please enter a valid email address.", Toast.LENGTH_SHORT).show();

            return false;
        }


        return true;
    }
    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }
    public class LoginDetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb= new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("login");


            wb.addProperty("email", strings[0]);
            wb.addProperty("password", strings[1]);
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
                    id = jo.getString("id");
                    name = jo.getString("name");

                    Toast.makeText(Login.this, "success", Toast.LENGTH_SHORT).show();


                    SharedPreferences.Editor sh = getSharedPreferences("user", MODE_PRIVATE).edit();
                    sh.putString("id", id);
                    sh.putString("name", name);
                    sh.apply();

                } catch (JSONException e) {
                    e.printStackTrace();
                }

                Intent i = new Intent(Login.this,HomeCust.class);
                startActivity(i);


            } else {
                Toast.makeText(Login.this, "failed", Toast.LENGTH_SHORT).show();

            }
        }


    }
}