package com.example.tradiesonclick;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.viewpager2.adapter.FragmentStateAdapter;

import com.example.tradiesonclick.fragments.Active;
import com.example.tradiesonclick.fragments.History;
import com.example.tradiesonclick.fragments.Rejected;

import java.util.ArrayList;
import java.util.List;

public class MyViewPagerAdapter extends FragmentStateAdapter {
    private ArrayList<Bundle> activeBookings;
    private ArrayList<Bundle> rejectedBookings;
    private OnCancelClickListener cancelClickListener; // Use the common interface here

    private ArrayList<Bundle> historyBookings;


    public MyViewPagerAdapter(@NonNull FragmentActivity fragmentActivity, ArrayList<Bundle> activeBookings,ArrayList<Bundle> rejectedBookings,ArrayList<Bundle> historyBookings) {
        super(fragmentActivity);
        this.activeBookings = activeBookings != null ? activeBookings : new ArrayList<>();
        this.rejectedBookings = rejectedBookings != null ? rejectedBookings : new ArrayList<>();
        this.historyBookings = historyBookings != null ? historyBookings : new ArrayList<>();
    }

    @NonNull
    @Override
    public Fragment createFragment(int position) {
        switch (position) {
            case 1:
                return Rejected.newInstance(rejectedBookings);
            case 2:
                return History.newInstance(historyBookings);
            default:
                return Active.newInstance(activeBookings,cancelClickListener);
        }
    }

    @Override
    public int getItemCount() {
        return 3;
    }

    public void setOnCancelClickListener(OnCancelClickListener listener) {
        this.cancelClickListener = listener;
    }
}
