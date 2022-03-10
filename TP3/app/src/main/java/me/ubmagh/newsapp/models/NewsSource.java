package me.ubmagh.newsapp.models;

import java.io.Serializable;

public class NewsSource implements Serializable {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
