package me.ubmagh.infilestoringapp;

import android.os.Bundle;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;

import android.util.Log;
import androidx.lifecycle.ViewModelProvider;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;
import me.ubmagh.infilestoringapp.databinding.ActivityMainBinding;
import me.ubmagh.infilestoringapp.models.DataSharingModel;
import me.ubmagh.infilestoringapp.models.Student;
import me.ubmagh.infilestoringapp.models.StudentsStore;
import android.view.Menu;
import android.view.MenuItem;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private AppBarConfiguration appBarConfiguration;
    private ActivityMainBinding binding;

    private DataSharingModel dataSharingModel;
    private List<Student> data;

    private FileInputStream fis;
    private FileOutputStream fos;
    private ObjectInputStream ois;
    private ObjectOutputStream oos;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        dataSharingModel = new ViewModelProvider(this).get(DataSharingModel.class);
        dataSharingModel.getData().observe(this, item -> {
            // Perform an action with the latest item data
            try{
                Log.i(" MainActivity ", " Data received <============== size :  "+data.size());
                data = new ArrayList<Student>(item);
                Log.i(" MainActiPersisting ", " Persisted Data <============== ");
                persisteChanges();
            }catch(Exception exc){
                Log.e(" Exception ", "Error when persisting changes !");
                Snackbar.make( findViewById(android.R.id.content), "Error when persisting changes !", Snackbar.LENGTH_LONG).setAction("Action", null).show();
            }
        });

        try {
            File file = getApplicationContext().getFileStreamPath(getResources().getString(R.string.storingFileName));
            if( !file.exists() ) {
                file.createNewFile();
                data = new ArrayList<Student>();
            } else {
                fis = openFileInput( getResources().getString( R.string.storingFileName) );
                ois = new ObjectInputStream( fis );
                StudentsStore studentsStore  = (StudentsStore) ois.readObject();
                if( studentsStore==null ){
                    data = new ArrayList<Student>();
                }else{
                    data = studentsStore.getStudents();
                }
                Log.i(" MainActiUnmarshallling", " Deserialized Data <============== size : "+data.size());
                dataSharingModel.setData(data);
                ois.close();
                fis.close();
            }
        }catch (Exception exc){
            Log.e("Exception", " StoreFile oppening: "+exc.getMessage() );
            Snackbar.make( findViewById(android.R.id.content), "Can't open students StoreFile ! try again later !!", Snackbar.LENGTH_LONG)
                    .setAction("Action", null).show();
        }

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        setSupportActionBar(binding.toolbar);

        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_main);
        appBarConfiguration = new AppBarConfiguration.Builder(navController.getGraph()).build();
        NavigationUI.setupActionBarWithNavController(this, navController, appBarConfiguration);
    }


    public void persisteChanges() throws Exception{
        StudentsStore studentsStore = new StudentsStore();
        studentsStore.setStudents( data );
            fos = openFileOutput( getResources().getString( R.string.storingFileName), MODE_PRIVATE );
            oos = new ObjectOutputStream( fos );
            oos.writeObject(studentsStore);
            oos.flush();
            ois.close();
            fis.close();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }


    @Override
    public boolean onSupportNavigateUp() {
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_main);
        return NavigationUI.navigateUp(navController, appBarConfiguration) || super.onSupportNavigateUp();
    }
}