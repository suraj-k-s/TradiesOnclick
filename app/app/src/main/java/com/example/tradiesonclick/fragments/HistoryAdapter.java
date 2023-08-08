package com.example.tradiesonclick.fragments;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.tradiesonclick.R;
import com.example.tradiesonclick.RatingPage;

import java.util.ArrayList;

public class HistoryAdapter extends RecyclerView.Adapter<HistoryAdapter.ViewHolder> {
    private static ArrayList<Bundle> historyBookings;

    public HistoryAdapter(ArrayList<Bundle> historyBookings) {
        this.historyBookings = historyBookings;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.historypage, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Bundle bookingDetails = historyBookings.get(position);
        holder.bind(bookingDetails);
    }

    @Override
    public int getItemCount() {
        return historyBookings.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder {
        TextView nameTextView;
        TextView serviceTypeTextView;
        TextView requestedOnTextView;
        TextView requestedForTextView;
        TextView requestedPhoneTextView;

        Button reviewButton;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);

            nameTextView = itemView.findViewById(R.id.textView38);
            serviceTypeTextView = itemView.findViewById(R.id.textView39);
            requestedOnTextView = itemView.findViewById(R.id.textView41);
            requestedForTextView = itemView.findViewById(R.id.textView42);
            requestedPhoneTextView = itemView.findViewById(R.id.textView40n2);
            reviewButton = itemView.findViewById(R.id.button8);

            reviewButton = itemView.findViewById(R.id.button8);
            reviewButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    int position = getAdapterPosition();
                    if (position != RecyclerView.NO_POSITION) {
                        Bundle bookingDetails = historyBookings.get(position);
                        String id = bookingDetails.getString("tid");
                        openReviewPage(id);
                    }
                }
            });
        }

        private void openReviewPage(String id) {

            Intent intent = new Intent(itemView.getContext(), RatingPage.class);
            intent.putExtra("tid", id);

            itemView.getContext().startActivity(intent);
        }

        public void bind(Bundle bookingDetails) {
            String name = bookingDetails.getString("name");
            String serviceType = bookingDetails.getString("serivce");
            String requestedOn = bookingDetails.getString("bdate");
            String requestedFor = bookingDetails.getString("fdate");
            String requestedPhone = bookingDetails.getString("phone");
            // Extract other data and set them to respective TextViews
            nameTextView.setText(name);
            serviceTypeTextView.setText(serviceType);
            requestedOnTextView.setText(requestedOn);
            requestedForTextView.setText(requestedFor);
            requestedPhoneTextView.setText(requestedPhone);


        }
    }
}
