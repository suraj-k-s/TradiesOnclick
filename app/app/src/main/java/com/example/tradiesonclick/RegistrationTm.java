package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Spinner;
import java.util.List;
import java.util.ArrayList;
import android.widget.ArrayAdapter;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

public class RegistrationTm extends AppCompatActivity {
    private Spinner localPlaceSpinner;
    private Spinner serviceTypeSpinner;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration_tm);

        localPlaceSpinner = findViewById(R.id.localPlaceSpinner);
        serviceTypeSpinner = findViewById(R.id.serviceTypeSpinner);

// Create a list of items

        localPlaceSpinner = findViewById(R.id.localPlaceSpinner);
        serviceTypeSpinner = findViewById(R.id.serviceTypeSpinner);

        // Create a list of local places
        List<String> localPlaces = new ArrayList<>();
        localPlaces.add("Select Local Place");
        localPlaces.add("Local Place 1");
        localPlaces.add("Local Place 2");
        localPlaces.add("Local Place 3");

        // Create an ArrayAdapter for local place Spinner
        ArrayAdapter<String> localPlaceAdapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, localPlaces);
        localPlaceAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        localPlaceSpinner.setAdapter(localPlaceAdapter);

        // Create a list of service types
        List<String> serviceTypes = new ArrayList<>();
        serviceTypes.add("Select Service Type");
        serviceTypes.add("Service Type 1");
        serviceTypes.add("Service Type 2");
        serviceTypes.add("Service Type 3");

        // Create an ArrayAdapter for service type Spinner
        ArrayAdapter<String> serviceTypeAdapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, serviceTypes);
        serviceTypeAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        serviceTypeSpinner.setAdapter(serviceTypeAdapter);
    }
}