package me.ubmagh.newsapp.services;

import me.ubmagh.newsapp.models.NewsListResponse;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface RestApiService {

    @GET("everything")
    Call<NewsListResponse> listUsersByKey(@Query("q") String q, @Query("from") String from, @Query("apiKey") String apiKey);

}
