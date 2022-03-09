package me.ubmagh.github_rest_api.model;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class ListUsersResonse {
    @SerializedName("total_count")
    private int totalCount;
    @SerializedName("items")
    private List<User> users;

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
