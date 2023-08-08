package com.example.tradiesonclick.fragments;

import android.content.Intent;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

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


public class History extends Fragment {

    public History() {
    }

    public static History newInstance(ArrayList<Bundle> historyBookings) {
        History fragment = new History();
        Bundle args = new Bundle();
        args.putParcelableArrayList("historyBookings", historyBookings);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_history, container, false);
        ArrayList<Bundle> historyBookings = getArguments().getParcelableArrayList("historyBookings");


        if (historyBookings == null) {
            return rootView;
        }

        RecyclerView recyclerView = rootView.findViewById(R.id.recyclerViewHistory);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        HistoryAdapter historyAdapter = new HistoryAdapter(historyBookings);
        recyclerView.setAdapter(historyAdapter);
        return rootView;


    }
}


















