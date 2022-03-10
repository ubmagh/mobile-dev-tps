package me.ubmagh.newsapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AdapterView;
import com.google.android.material.textfield.TextInputLayout;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import me.ubmagh.newsapp.models.Article;
import me.ubmagh.newsapp.models.ArticlesListAdapter;
import me.ubmagh.newsapp.models.NewsListResponse;
import me.ubmagh.newsapp.services.RestApiService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;



public class MainActivity extends AppCompatActivity {

    private TextInputLayout keywordsInput;
    private Button searchBtn;
    private TextView dateInput;
    private Calendar calendar;
    private int year, month, day;
    private DatePicker datePicker;
    private ListView listViewNews;
    private List<Article> data;
    private Retrofit retrofit;
    private ArticlesListAdapter adapter;
    private RestApiService serviceAPI;

    private ProgressBar progressBar;
    private LinearLayout errorLayout;

    enum MyMainLayouts {
        MAIN, ERROR, LOADING
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();

        dateInput = (TextView) findViewById(R.id.dateInput);
        calendar = Calendar.getInstance();
        year = calendar.get(Calendar.YEAR);

        month = calendar.get(Calendar.MONTH);
        day = calendar.get(Calendar.DAY_OF_MONTH);
        showDate(year, month+1, day);
        keywordsInput = findViewById( R.id.keywordsInput);
        searchBtn = findViewById( R.id.searchBtn);
        listViewNews = findViewById( R.id.listViewNews);

        progressBar = findViewById(R.id.spinner);
        errorLayout = findViewById(R.id.errorLayout);

        data = new ArrayList<Article>();
        adapter = new ArticlesListAdapter( this, R.layout.articles_list_item, data);
        listViewNews.setAdapter(adapter);

        retrofit=new Retrofit.Builder().baseUrl("https://newsapi.org/v2/").addConverterFactory(GsonConverterFactory.create()).build();
        serviceAPI = retrofit.create(RestApiService.class);

        listViewNews.setOnItemClickListener( new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick( AdapterView<?> adapterView, View view, int i, long l) {
                Intent intent=new Intent( getApplicationContext(), ArticleActivity.class);
                intent.putExtra("article",data.get(i));
                startActivity(intent);
            }
        });
        searchBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                searchListener();
            }
        });
        searchListener();
    }



    private void searchListener(){
        data.clear();
        switchView(MyMainLayouts.LOADING);
        String keywords = keywordsInput.getEditText().getText().toString();
        String fromDate = dateInput.getText().toString();
        if( keywords.trim().length()==0 ) {
            Toast.makeText(getApplicationContext(), " You have to enter some searching keywords !! ",Toast.LENGTH_LONG).show();
            switchView(MyMainLayouts.MAIN);
            return;
        }
        Call<NewsListResponse> newsListResponseCall;
        newsListResponseCall = serviceAPI.listUsersByKey( keywords, fromDate, "bdccb2e2430844eaa5e3099ccc0b0ab5"); // |:< 😡
        newsListResponseCall.enqueue(new Callback<NewsListResponse>() {
            @Override
            public void onResponse(Call<NewsListResponse> call, Response<NewsListResponse> response) {
                NewsListResponse articlesList=response.body();

                if( articlesList==null ){
                    Toast.makeText( getApplicationContext(), " Nothing found ! ", Toast.LENGTH_LONG).show();
                    switchView(MyMainLayouts.ERROR);
                    return;
                }

                for ( Article article: articlesList.getArticles()) {
                    data.add(article);
                }
                adapter.notifyDataSetChanged();
                switchView(MyMainLayouts.MAIN);
            }
            @Override
            public void onFailure(Call<NewsListResponse> call, Throwable t) {
                Toast.makeText( getApplicationContext(), " Network error ! ", Toast.LENGTH_LONG).show();
                Log.e("error","Network error !!");
                switchView(MyMainLayouts.ERROR);
            }
        });
    }


    @SuppressWarnings("deprecation")
    public void setDate(View view) {
        showDialog(999);
        Toast.makeText(getApplicationContext(), "Choose the date after which news are published", Toast.LENGTH_SHORT).show();
    }


    protected Dialog onCreateDialog(int id) {
        if (id == 999) {
            return new DatePickerDialog(this,myDateListener, year, month, day);
        }
        return null;
    }


    private DatePickerDialog.OnDateSetListener myDateListener = new DatePickerDialog.OnDateSetListener() {
                @Override
                public void onDateSet( DatePicker arg0, int arg1, int arg2, int arg3) {
                    // arg1 = year
                    // arg2 = month
                    // arg3 = day
                    showDate(arg1, arg2+1, arg3);
                }
            };


    private void showDate(int year, int month, int day) {
        dateInput.setText(new StringBuilder().append(year).append("-").append(month).append("-").append(day));
    }

    private void switchView(@NonNull MyMainLayouts layoutIndex){
        switch (layoutIndex){
            case ERROR:
                errorLayout.setVisibility(View.VISIBLE);
                progressBar.setVisibility(View.GONE);
                listViewNews.setVisibility(View.GONE);
                break;
            case LOADING:
                progressBar.setVisibility(View.VISIBLE);
                errorLayout.setVisibility(View.GONE);
                listViewNews.setVisibility(View.GONE);
                break;
            default:
                listViewNews.setVisibility(View.VISIBLE);
                errorLayout.setVisibility(View.GONE);
                progressBar.setVisibility(View.GONE);
        }
    }
}