package com.example.tradiesonclick.fragments;

import static android.content.Context.MODE_PRIVATE;

import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.example.tradiesonclick.MyBookings;
import com.example.tradiesonclick.OnCancelClickListener;
import com.example.tradiesonclick.R;
import com.example.tradiesonclick.SearchForTradesmen;
import com.example.tradiesonclick.VPAdapter;
import com.example.tradiesonclick.WebServiceCaller;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.tradiesonclick.R;

import java.util.ArrayList;

public class Active extends Fragment {
    private OnCancelClickListener cancelClickListener; // Add the listener here

    public Active() {
    }

    public static Active newInstance(ArrayList<Bundle> activeBookings, OnCancelClickListener listener) {
        Active fragment = new Active();
        fragment.cancelClickListener = listener; // Set the listener here

        Bundle args = new Bundle();
        args.putParcelableArrayList("activeBookings", activeBookings);
        fragment.setArguments(args);
        ActiveAdapter adapter = new ActiveAdapter(activeBookings,listener);
        adapter.setOnCancelClickListener(listener);

        return fragment;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_active, container, false);

        ArrayList<Bundle> activeBookings = getArguments().getParcelableArrayList("activeBookings");

        if (activeBookings == null) {
            return rootView;
        }

        RecyclerView recyclerView = rootView.findViewById(R.id.recyclerViewActive);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        ActiveAdapter activeAdapter = new ActiveAdapter(activeBookings,cancelClickListener);
        recyclerView.setAdapter(activeAdapter);

        return rootView;
    }
}
