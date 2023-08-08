package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class EditProfile extends AppCompatActivity {

    EditText name,contact,email,address;
    String id,cname,caddress,ccontact,cemail;
    String ename,eaddress,eemail,econtact;
    Button editButton;

    String sh_name="MySh";

    DrawerLayout drawerLayout;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);

        drawerLayout = findViewById(R.id.drawer_loayout);

        name = findViewById(R.id.et_ename);
        contact = findViewById(R.id.et_econtact);
        email = findViewById(R.id.et_eemail);
        address = findViewById(R.id.et_eaddress);
        editButton = findViewById(R.id.editbutton);

        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

        myprofile m=new myprofile();
        m.execute(id);

        editButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ename = name.getText().toString();
                eaddress = address.getText().toString();
                eemail = email.getText().toString();
                econtact = contact.getText().toString();

                EditprofileE e = new EditprofileE();
                e.execute(id,ename,eaddress,econtact,eemail);


            }
        });

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
            JSONArray job= null;
            //Toast.makeText(EditProfile.this, s, Toast.LENGTH_SHORT).show();
            //Log.d("Profile", s);
            try{
                job=new JSONArray(s);
                JSONObject jo=job.getJSONObject(0);
                cname=jo.getString("name");
                caddress=jo.getString("address");
                ccontact=jo.getString("phone");
                cemail=jo.getString("email");


                name.setText(cname);
                contact.setText(ccontact);
                email.setText(cemail);
                address.setText(caddress);


            }catch(JSONException e){
                e.printStackTrace();
            }

        }
    }

  public   class EditprofileE extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller=new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("editprofile");
            caller.addProperty("userid",params[0]);
            caller.addProperty("username",params[1]);
            caller.addProperty("useraddress",params[2]);
            caller.addProperty("usercontact",params[3]);
            caller.addProperty("useremail",params[4]);


            caller.callWebService();
            String res= caller.getResponse();
            return res;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);


           // Log.d("hai", result);
            if(result.equals("Success")){
                Toast.makeText(getApplicationContext(), "Profile Update Successful", Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(getApplicationContext(),HomeCust.class);
                startActivity(intent);
            }
            else{
                Toast.makeText(getApplicationContext(), "Profile Update FAILED", Toast.LENGTH_SHORT).show();
            }

        }

    }



}