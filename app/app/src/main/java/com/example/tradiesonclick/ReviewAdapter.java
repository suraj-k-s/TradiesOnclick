package com.example.tradiesonclick;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class ReviewAdapter extends RecyclerView.Adapter<ReviewAdapter.MyViewHolder> {

    private String  name[], dateNtime[], content[];
    private float rating[];


    private Context context;

    public ReviewAdapter(Context ct, String[] Name, String[] DateNTime, String[] Content,float[] Rating) {
        context = ct;
        name = Name;
        dateNtime = DateNTime;
        content = Content;
        rating = Rating;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.reviews_by_customer, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {

        holder.nameTextView.setText(name[position]);
        holder.dateNtimeView.setText(dateNtime[position]);
        holder.contentTextview.setText(content[position]);
        holder.ratingBar.setRating(rating[position]);




    }

    @Override
    public int getItemCount() {
        return content.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {

        TextView nameTextView;
        TextView dateNtimeView;
        TextView contentTextview;
        RatingBar ratingBar;


        public MyViewHolder(@NonNull View itemView) {
            super(itemView);

            nameTextView = itemView.findViewById(R.id.review_name_cu);
            dateNtimeView = itemView.findViewById(R.id.date_time);
            contentTextview = itemView.findViewById(R.id.content_txt);
            ratingBar = itemView.findViewById(R.id.cust_rate);

        }
    }
}
