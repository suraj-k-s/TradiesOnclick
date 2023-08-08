package com.example.tradiesonclick;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

public class VPAdapter extends RecyclerView.Adapter<VPAdapter.MyViewHolder> {

    private String image[], name[], type[], charge[],id[];
    private Context context;

    public VPAdapter(Context ct, String Image[], String Name[], String Type[], String Charge[],String Id[]) {
        context = ct;
        type = Type;
        image = Image;
        name = Name;
        charge = Charge;
        id = Id;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.tradie_view, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        Picasso.get().load(image[position]).into(holder.imageView);
        holder.nameTextView.setText(name[position]);
        holder.typeTextView.setText(type[position]);
        holder.chargeTextView.setText(charge[position]);
        String clickedId = id[position];
        holder.viewDetals.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(context, BookingPage.class);
                intent.putExtra("id", clickedId);
                context.startActivity(intent);
            }
        });




    }

    @Override
    public int getItemCount() {
        return type.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        ImageView imageView;
        TextView nameTextView;
        TextView typeTextView;
        TextView chargeTextView;

        Button viewDetals;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            imageView = itemView.findViewById(R.id.imageView);
            nameTextView = itemView.findViewById(R.id.nameTextView);
            typeTextView = itemView.findViewById(R.id.typeTextView);
            chargeTextView = itemView.findViewById(R.id.chargeTextView);
            viewDetals = itemView.findViewById(R.id.detailsButton);

        }
    }
}
