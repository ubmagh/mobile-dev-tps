package me.ubmagh.infilestoringapp;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;
import androidx.navigation.fragment.NavHostFragment;

import com.google.android.material.snackbar.Snackbar;

import java.util.ArrayList;
import java.util.List;

import me.ubmagh.infilestoringapp.databinding.FragmentFirstBinding;
import me.ubmagh.infilestoringapp.models.DataSharingModel;
import me.ubmagh.infilestoringapp.models.Student;
import me.ubmagh.infilestoringapp.models.StudentAdapter;

public class FirstFragment extends Fragment {

    private FragmentFirstBinding binding;
    private ListView listView;

    private MainActivity mainActivity;
    private StudentAdapter adapter;

    private List<Student> data;
    private DataSharingModel dataSharingModel;


    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {

        binding = FragmentFirstBinding.inflate(inflater, container, false);
        data = new ArrayList<Student>();
        listView = binding.listView;
        adapter = new StudentAdapter( getContext(), R.layout.students_list_item, data);
        listView.setAdapter(adapter);
        setHasOptionsMenu(true);
        return binding.getRoot();
    }


    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setHasOptionsMenu(true);

        binding.fab2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                NavHostFragment.findNavController(FirstFragment.this).navigate(R.id.action_FirstFragment_to_SecondFragment);
                /*  Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG).setAction("Action", null).show();*/
            }
        });
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        mainActivity = (MainActivity) getActivity();
        dataSharingModel = new ViewModelProvider(mainActivity).get(DataSharingModel.class);
        dataSharingModel.getData().observe( getViewLifecycleOwner(), receivedData->{
            data.clear();
            data.addAll(receivedData);
            adapter.notifyDataSetChanged();
            Log.i(" 1stFrag ", " Data received <============== size :  "+data.size());
        });
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_github) {
            String url = "https://github.com/ubmagh/mobile-dev-tps/tree/main/TP4";

            Intent i = new Intent(Intent.ACTION_VIEW);
            i.setData(Uri.parse(url));
            startActivity(i);

            Log.i(" 1stFrag -OPtionsMenu ", " github clicked <============== ");
            return true;
        }
        if( id == R.id.action_clear ){
            Log.i(" 1stFrag -OPtionsMenu ", " clear clicked <============== ");
            dataSharingModel.setData( new ArrayList<Student>() );
            Snackbar.make( getView(), "Data cleared successfully!", Snackbar.LENGTH_LONG).setAction("Action", null).show();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }



    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}