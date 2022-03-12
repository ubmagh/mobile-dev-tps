package me.ubmagh.infilestoringapp.models;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import java.util.ArrayList;
import java.util.List;

public class DataSharingModel extends ViewModel {


    private final MutableLiveData<List<Student>> data = new MutableLiveData<List<Student>>();

    public void setData(List<Student> dataa) {
        data.setValue(dataa);
    }

    public LiveData<List<Student>> getData() {
        return data;
    }
}
