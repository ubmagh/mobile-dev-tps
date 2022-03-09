package me.ubmagh.github_rest_api;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import me.ubmagh.github_rest_api.model.ListUserAdapter;
import me.ubmagh.github_rest_api.model.ListUsersResonse;
import me.ubmagh.github_rest_api.model.User;
import me.ubmagh.github_rest_api.service.RestServiceAPI;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
       // StrictMode.ThreadPolicy strictMode=new StrictMode.ThreadPolicy.Builder().permitAll().build();
        //StrictMode.setThreadPolicy(strictMode);

        ListView listViewUsers=findViewById(R.id.listViewUsers);
        EditText editTextSearch=findViewById(R.id.editTextSearch);
        Button buttonSearch=findViewById(R.id.buttonSearch);

        List<User> data=new ArrayList<>();
        //ArrayAdapter adapter=new ArrayAdapter(this, android.R.layout.simple_list_item_1,data);
        ListUserAdapter adapter=new ListUserAdapter(this,R.layout.list_user_item,data);
        listViewUsers.setAdapter(adapter);

        Retrofit retrofit=new Retrofit.Builder().baseUrl("https://api.github.com/")
                .addConverterFactory(GsonConverterFactory.create()).build();
        RestServiceAPI serviceAPI=retrofit.create(RestServiceAPI.class);

        listViewUsers.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Toast.makeText(getApplicationContext(), " you clicked on: "+data.get(i).getLogin(),Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(getApplicationContext(),UserActivity.class);
                intent.putExtra("user",data.get(i));
                startActivity(intent);
            }
        });

        buttonSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                data.clear();
                String key=editTextSearch.getText().toString();
                Call<ListUsersResonse> callUsers;
                callUsers=serviceAPI.listUsersByKey(key);
                callUsers.enqueue(new Callback<ListUsersResonse>() {
                    @Override
                    public void onResponse(Call<ListUsersResonse> call, Response<ListUsersResonse> response) {
                        ListUsersResonse listUsers=response.body();

                        if( listUsers==null ){
                            Toast.makeText(getApplicationContext(), " Enter the username !! ",Toast.LENGTH_SHORT).show();
                            return;
                        }

                        for (User user:listUsers.getUsers()) {
                            data.add(user);
                        }
                        adapter.notifyDataSetChanged();
                    }
                    @Override
                    public void onFailure(Call<ListUsersResonse> call, Throwable t) {
                        Log.e("error","Network error !!");
                    }
                });
            }
        });

    }
}