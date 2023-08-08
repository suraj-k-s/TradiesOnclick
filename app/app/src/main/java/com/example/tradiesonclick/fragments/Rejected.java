package com.example.tradiesonclick.fragments;

import android.content.Intent;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.View;

import android.view.LayoutInflater;

import android.view.ViewGroup;
import android.widget.Button;



import com.example.tradiesonclick.Login;
import com.example.tradiesonclick.MyBookings;
import com.example.tradiesonclick.R;
import com.example.tradiesonclick.RegistrationCust;
import com.example.tradiesonclick.SearchForTradesmen;

import java.util.ArrayList;


public class Rejected extends Fragment {

    public Rejected() {
    }

    public static Rejected newInstance(ArrayList<Bundle> rejectBookings) {
        Rejected fragment = new Rejected();
        Bundle args = new Bundle();
        args.putParcelableArrayList("rejectBookings", rejectBookings);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_rejected, container, false);
        ArrayList<Bundle> rejectedBookings = getArguments().getParcelableArrayList("rejectBookings");


        if (rejectedBookings == null) {
            Log.d("RejectedFragment", "Rejected Bookings List is null.");
            return rootView;
        }

        Log.d("RejectedFragment", "Rejected Bookings: " + rejectedBookings.toString());


        RecyclerView recyclerView = rootView.findViewById(R.id.recyclerViewReject);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        RejectAdapter rejectAdapter = new RejectAdapter(rejectedBookings);
        recyclerView.setAdapter(rejectAdapter);
        return rootView;
    }
}


















