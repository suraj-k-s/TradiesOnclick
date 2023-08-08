package com.example.tradiesonclick;

import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.widget.TextView;

import android.os.Bundle;
import android.provider.MediaStore;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
public class Registration extends AppCompatActivity {
    private static final int REQUEST_SELECT_PHOTO = 1;
    private Button btnSelectPhoto;
    private TextView txtSelectedPhotoUrl;


    private static final int REQUEST_IMAGE_SELECTION = 2;

    private Button buttonUpload;
    private ImageView imageViewPhoto;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);

        btnSelectPhoto = findViewById(R.id.btnSelectPhoto);
        txtSelectedPhotoUrl = findViewById(R.id.txtSelectedPhotoUrl);

        btnSelectPhoto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Create an intent to open the file chooser
                Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
                intent.setType("image/*");
                startActivityForResult(intent, REQUEST_SELECT_PHOTO);
            }
        });
    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == REQUEST_SELECT_PHOTO && resultCode == RESULT_OK) {
            if (data != null) {
                // Get the selected image URI
                Uri selectedImageUri = data.getData();

                // Display the selected image URI
                txtSelectedPhotoUrl.setText(selectedImageUri.toString());
            }
        }
    }
}