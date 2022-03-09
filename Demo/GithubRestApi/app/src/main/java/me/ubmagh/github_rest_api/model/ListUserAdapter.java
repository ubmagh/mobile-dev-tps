package me.ubmagh.github_rest_api.model;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.w3c.dom.Text;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import me.ubmagh.github_rest_api.R;

public class ListUserAdapter extends ArrayAdapter<User> {
    private int resource;
    public ListUserAdapter(@NonNull Context context, int resource, @NonNull List<User> users) {
        super(context, resource, users);
        this.resource=resource;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View listItemView=convertView;
        if(listItemView==null){
          listItemView= LayoutInflater.from(getContext()).inflate(resource,parent,false);
        }
        TextView textViewLogin=listItemView.findViewById(R.id.textViewLogin);
        TextView textViewScore=listItemView.findViewById(R.id.textViewScore);
        ImageView imageView=listItemView.findViewById(R.id.imageView);
        textViewScore.setText(String.valueOf(getItem(position).getScore()));
        textViewLogin.setText(getItem(position).getLogin());
        Runnable thread= new Runnable(){
            @Override
            public void run() {
                try {
                    Log.i("info",getItem(position).getAvatarUrl());
                    URL url=new URL(getItem(position).getAvatarUrl());
                    Bitmap bitmap= BitmapFactory.decodeStream(url.openStream());
                    imageView.setImageBitmap(bitmap);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        };
        Thread t=new Thread(thread);
        t.start();

        return listItemView;
    }
}
