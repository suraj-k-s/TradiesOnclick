package com.example.tradiesonclick.fragments;

import android.content.Intent;
import android.graphics.Color;
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

import com.example.tradiesonclick.OnCancelClickListener;
import com.example.tradiesonclick.R;
import com.example.tradiesonclick.RatingPage;
import com.example.tradiesonclick.payment;

import java.util.ArrayList;

public class ActiveAdapter extends RecyclerView.Adapter<ActiveAdapter.ViewHolder> {
    private static ArrayList<Bundle> activeBookings;
    private OnCancelClickListener cancelClickListener; // Add the listener here


    public ActiveAdapter(ArrayList<Bundle> activeBookings, com.example.tradiesonclick.OnCancelClickListener listener) {
        this.activeBookings = activeBookings;
        this.cancelClickListener = listener; // Set the listener here

    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.activepage, parent, false);
        return new ViewHolder(view, cancelClickListener);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Bundle bookingDetails = activeBookings.get(position);
        holder.bind(bookingDetails);
    }

    @Override
    public int getItemCount() {
        return activeBookings.size();
    }

    public void setOnCancelClickListener(OnCancelClickListener listener) {
        this.cancelClickListener = listener;
    }
    static class ViewHolder extends RecyclerView.ViewHolder {
        private final OnCancelClickListener cancelClickListener;
        TextView nameTextView;
        TextView serviceTypeTextView;
        TextView requestedOnTextView;
        TextView requestedForTextView;
        TextView requestedPhoneTextView;
        TextView requestedStatusText;
        Button submitButton;

        public ViewHolder(@NonNull View itemView,OnCancelClickListener listener) {
            super(itemView);
            nameTextView = itemView.findViewById(R.id.textView38);
            serviceTypeTextView = itemView.findViewById(R.id.textView39);
            requestedOnTextView = itemView.findViewById(R.id.textView41);
            requestedForTextView = itemView.findViewById(R.id.textView42);
            requestedPhoneTextView = itemView.findViewById(R.id.textView40n2);
            requestedStatusText= itemView.findViewById(R.id.textView43);
            submitButton= itemView.findViewById(R.id.button8);

            this.cancelClickListener = listener;

            submitButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    String buttonText = submitButton.getText().toString();
                    if (buttonText.equals("Pay Advance")) {
                        // Call the function for Pay Advance
                        callPayAdvanceFunction();
                    } else if (buttonText.equals("Cancel")) {
                        // Call the function for Cancel
                        callCancelFunction();
                    }
                }
            });
        }

        private void callPayAdvanceFunction() {
            Intent intent = new Intent(itemView.getContext(), payment.class);
            String bid = activeBookings.get(getAdapterPosition()).getString("bid");
            showToast("Pay Advance clicked. Bid: " + bid);
            openPaymentPage(bid);

        }
        private void openPaymentPage(String id) {

//            System.out.println(id);
            Intent intent = new Intent(itemView.getContext(), payment.class);
            intent.putExtra("bid", id);

            itemView.getContext().startActivity(intent);
        }

        private void callCancelFunction() {
            String bid = activeBookings.get(getAdapterPosition()).getString("bid");
            if (cancelClickListener != null) {
                cancelClickListener.onCancelClick(bid);
            }
        }

        private void showToast(String message) {
            // Display a toast with the given message
            Toast.makeText(itemView.getContext(), message, Toast.LENGTH_SHORT).show();
        }


        public void bind(Bundle bookingDetails) {
            String name = bookingDetails.getString("name");
            String serviceType = bookingDetails.getString("serivce");
            String requestedOn = bookingDetails.getString("bdate");
            String requestedFor = bookingDetails.getString("fdate");
            String requestedPhone = bookingDetails.getString("phone");
            String requestedStatus = bookingDetails.getString("rstatus");
            String requestedPStatus = bookingDetails.getString("pstatus");
            nameTextView.setText(name);
            serviceTypeTextView.setText(serviceType);
            requestedOnTextView.setText(requestedOn);
            requestedForTextView.setText(requestedFor);
            requestedPhoneTextView.setText(requestedPhone);
             if (requestedPStatus.equals("1")){
                int colorValue = Color.parseColor("#e08a19");
                requestedStatusText.setTextColor(colorValue);
                requestedStatusText.setText("Accepted");
                submitButton.setText("Advance Paid");
            }else if(requestedStatus.equals("0"))
            {
                int colorValue = Color.parseColor("#242ac9");
                requestedStatusText.setTextColor(colorValue);
                requestedStatusText.setText("Pending");
                submitButton.setText("Cancel");

            }
            else {
                int colorValue = Color.parseColor("#e08a19");
                requestedStatusText.setTextColor(colorValue);
                requestedStatusText.setText("Accepted");
                submitButton.setText("Pay Advance");
            }

        }
    }

}
