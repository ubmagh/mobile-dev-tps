package me.ubmagh.newsapp.models;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.net.URL;
import java.util.List;

import me.ubmagh.newsapp.R;

public class ArticlesListAdapter extends ArrayAdapter<Article> {

    private int resource;
    public ArticlesListAdapter(@NonNull Context context, int resource, @NonNull List<Article> articles) {
        super( context, resource, articles);
        this.resource=resource;
    }

    @NonNull
    @Override
    public View getView( int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View listItemView=convertView;
        if(listItemView==null){
            listItemView= LayoutInflater.from( getContext()).inflate( resource, parent, false);
        }
        TextView titleTextView=listItemView.findViewById( R.id.titleTextView );
        TextView sourceTextView=listItemView.findViewById( R.id.sourceTextView );
        ImageView imageView=listItemView.findViewById(R.id.imageView);
        titleTextView.setText(String.valueOf(getItem(position).getTitle()));
        sourceTextView.setText(getItem(position).getSource());
        Runnable thread= new Runnable(){
            @Override
            public void run() {
                try {
                    URL url=new URL(getItem(position).getUrlToImage());
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
