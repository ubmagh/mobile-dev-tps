package me.ubmagh.storage;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.google.android.material.textfield.TextInputLayout;

public class MainActivity extends AppCompatActivity {

    private TextInputLayout fname;
    private TextInputLayout lname;
    private TextInputLayout age;

    private Button saveBtn;
    private Button clearBtn;
    private Button loadBtn;
    private SharedPreferences sh;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        fname = findViewById( R.id.fname );
        lname = findViewById( R.id.lname );
        age = findViewById( R.id.age );

        saveBtn = findViewById( R.id.saveBtn );
        clearBtn = findViewById( R.id.clearBtn );
        loadBtn = findViewById( R.id.loadBtn );
        sh = getSharedPreferences( "mySharedPrefs", MODE_PRIVATE);


        saveBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SharedPreferences.Editor editor = sh.edit();
                try {
                    editor.putString("lname", lname.getEditText().getText().toString());
                    editor.putString("fname", fname.getEditText().getText().toString());
                    editor.putInt("age", Integer.parseInt(age.getEditText().getText().toString()));
                }catch(Exception exc){
                    Toast.makeText( getApplicationContext(), "Invalid data !", Toast.LENGTH_SHORT).show();
                }
                editor.apply();
                Toast.makeText( getApplicationContext(), "Data saved !", Toast.LENGTH_SHORT).show();
            }
        });

        loadBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SharedPreferences.Editor editor = sh.edit();
                lname.getEditText().setText( sh.getString( "lname", "" ).toString() );
                fname.getEditText().setText( sh.getString( "lname", "" ).toString() );
                age.getEditText().setText( String.valueOf(sh.getInt( "age", 0 )) );
                Toast.makeText( getApplicationContext(), "Data loaded !", Toast.LENGTH_SHORT).show();
            }
        });

        clearBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SharedPreferences.Editor editor = sh.edit();
                editor.clear();
                editor.apply();
                Toast.makeText( getApplicationContext(), "Saved Data is now Cleared !", Toast.LENGTH_SHORT).show();
            }
        });
    }
}