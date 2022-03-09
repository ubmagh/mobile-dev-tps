package me.ubmagh.github_rest_api.service;

import java.util.List;

import me.ubmagh.github_rest_api.model.ListUsersResonse;
import me.ubmagh.github_rest_api.model.User;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface RestServiceAPI {
    @GET("search/users")
    Call<ListUsersResonse> listUsersByKey(@Query("q") String key);
    @GET("users")
    Call<List<User>> listUsers();
}
