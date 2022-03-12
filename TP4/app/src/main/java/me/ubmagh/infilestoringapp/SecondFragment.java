package me.ubmagh.infilestoringapp;

import android.app.DatePickerDialog;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;
import androidx.navigation.fragment.NavHostFragment;
import com.google.android.material.snackbar.Snackbar;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import me.ubmagh.infilestoringapp.databinding.FragmentSecondBinding;
import me.ubmagh.infilestoringapp.models.DataSharingModel;
import me.ubmagh.infilestoringapp.models.Student;

public class SecondFragment extends Fragment {

    private FragmentSecondBinding binding;

    private EditText fname;
    private EditText lname;
    private EditText id;
    private EditText _class;
    private EditText bdate;
    private Button saveBtn;
    private Button cancelBtn;

    private MainActivity mainActivity;
    private List<Student> data;
    private DataSharingModel dataSharingModel;

    private Student stu;
    private View view;

    private Calendar calendar;
    private int mYear, mMonth, mDay;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {
        binding = FragmentSecondBinding.inflate( inflater, container, false);

        fname = binding.fname;
        lname = binding.lname;
        id = binding.idd;
        _class = binding.classs;
        bdate = binding.bdate;
        saveBtn = binding.saveBtn;
        cancelBtn = binding.cancelBtn;
        data = new ArrayList<Student>();
        view = inflater.inflate(R.layout.activity_main, container, false);
        return binding.getRoot();
    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        cancelBtn.setOnClickListener(view1 -> {
            NavHostFragment.findNavController(SecondFragment.this).navigate(R.id.action_SecondFragment_to_FirstFragment);
        });
        bdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                calendar = Calendar.getInstance();
                mYear = calendar.get ( Calendar.YEAR );
                mMonth = calendar.get ( Calendar.MONTH );
                mDay = calendar.get ( Calendar.DAY_OF_MONTH );
                //show dialog
                DatePickerDialog datePickerDialog = new DatePickerDialog (getContext(), new DatePickerDialog.OnDateSetListener(){
                    @Override
                    public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                        bdate.setText ( dayOfMonth +"-" + (month + 1) + "-"+ year  );
                    }
                }, mYear, mMonth, mDay );
                datePickerDialog.show ();
            }
        });
    }

    @Override
    public void onActivityCreated( @Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        mainActivity = (MainActivity) getActivity();
        dataSharingModel = new ViewModelProvider(mainActivity).get(DataSharingModel.class);
        dataSharingModel.getData().observe( getViewLifecycleOwner(), receivedData->{
            data = new ArrayList<>(receivedData);
            Log.i(" 2ndFrag ", " Data received <============== size :  "+data.size());
        });
        saveBtn.setOnClickListener(view1 ->{
            stu = new Student();
            stu.setID( id.getText().toString() );
            stu.setLname( lname.getText().toString() );
            stu.setFname( fname.getText().toString() );
            stu.setBirthDate( bdate.getText().toString() );
            stu.set_class( _class.getText().toString() );
            data.add( stu );

            dataSharingModel.setData( data);
            Log.i(" 2ndFrag ", " Data sent <============== ");

            Snackbar.make( getView(), "Can't persiste the created student into StoreFile!", Snackbar.LENGTH_LONG).setAction("Action", null).show();
            Snackbar.make( getView(), " Student saved successfully !", Snackbar.LENGTH_LONG).setAction("Action", null).show();
            id.setText(""); fname.setText(""); lname.setText(""); bdate.setText(""); _class.setText("");
        });
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding =  null;
        fname = lname = bdate = id = _class = null;
        saveBtn = cancelBtn = null;
    }

}