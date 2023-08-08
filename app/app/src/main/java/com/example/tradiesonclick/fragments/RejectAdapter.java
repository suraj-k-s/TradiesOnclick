package com.example.tradiesonclick.fragments;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.tradiesonclick.HomeCust;
import com.example.tradiesonclick.R;
import com.example.tradiesonclick.RatingPage;
import com.example.tradiesonclick.SearchForTradesmen;

import java.util.ArrayList;

public class RejectAdapter extends RecyclerView.Adapter<RejectAdapter.ViewHolder> {
    private static ArrayList<Bundle> rejectedBookings;

    public RejectAdapter(ArrayList<Bundle> rejectedBookings) {
        this.rejectedBookings = rejectedBookings;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.rejectedpage, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Bundle bookingDetails = rejectedBookings.get(position);
        // Extract booking data from the bundle and set it to the UI components in the ViewHolder
        holder.bind(bookingDetails);
    }

    @Override
    public int getItemCount() {
        return rejectedBookings.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder {
        TextView nameTextView;
        TextView serviceTypeTextView;
        TextView requestedOnTextView;
        TextView requestedForTextView;
        TextView requestedPhoneTextView;

        Button tryanother;



        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            // Initialize UI components here
            nameTextView = itemView.findViewById(R.id.textView38);
            serviceTypeTextView = itemView.findViewById(R.id.textView39);
            requestedOnTextView = itemView.findViewById(R.id.textView41);
            requestedForTextView = itemView.findViewById(R.id.textView42);
            requestedPhoneTextView = itemView.findViewById(R.id.textView40n2);
            tryanother= itemView.findViewById(R.id.button8);
            tryanother.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    int position = getAdapterPosition();
                    if (position != RecyclerView.NO_POSITION) {
                        Bundle bookingDetails = rejectedBookings.get(position);
                        Intent intent = new Intent(itemView.getContext(), SearchForTradesmen.class);
                        itemView.getContext().startActivity(intent);
                    }
                }
            });
        }

        public void bind(Bundle bookingDetails) {
            String name = bookingDetails.getString("name");
            String serviceType = bookingDetails.getString("serivce");
            String requestedOn = bookingDetails.getString("bdate");
            String requestedFor = bookingDetails.getString("fdate");
            String requestedPhone = bookingDetails.getString("phone");
            nameTextView.setText(name);
            serviceTypeTextView.setText(serviceType);
            requestedOnTextView.setText(requestedOn);
            requestedForTextView.setText(requestedFor);
            requestedPhoneTextView.setText(requestedPhone);
        }
    }
}
