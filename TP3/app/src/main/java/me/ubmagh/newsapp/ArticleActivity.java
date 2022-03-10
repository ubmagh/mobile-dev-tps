package me.ubmagh.newsapp;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import me.ubmagh.newsapp.models.Article;


public class ArticleActivity extends AppCompatActivity {

    private TextView source;
    private TextView date;
    private TextView title;
    private TextView desc;
    private TextView content;
    private TextView author;
    private TextView link;
    private ImageView imageView;
    private Button goBackBtn;


    @Override
    protected void onCreate( @Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.news_view);
        getSupportActionBar().hide();

        Intent intent=getIntent();
        Article article= (Article) intent.getSerializableExtra("article");

        source = findViewById( R.id.sourceDet );
        date = findViewById( R.id.date );
        title = findViewById( R.id.TitleDet );
        desc = findViewById( R.id.descDet );
        content = findViewById( R.id.contentDet);
        author = findViewById( R.id.authorDet );
        link = findViewById( R.id.link );
        imageView=findViewById(R.id.imageViewProfile);
        goBackBtn = findViewById(R.id.goBackBtn);

        Date da = article.getPublishedAt();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm");

        source.setText( "source: "+ article.getSource() );
        date.setText( sdf.format(da) );
        title.setText( article.getTitle() );
        desc.setText( article.getDescription() );
        content.setText( article.getContent() );
        author.setText( "Author: " + article.getAuthor() );
        link.setText( article.getUrl());


        goBackBtn.setOnClickListener(view -> {
            this.finish();
        });

        Runnable thread= new Runnable(){
            @Override
            public void run() {
                try {
                    Log.i("info",article.getUrlToImage());
                    URL url=new URL(article.getUrlToImage());
                    Bitmap bitmap= BitmapFactory.decodeStream(url.openStream());
                    imageView.setImageBitmap(bitmap);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        };
        Thread t=new Thread(thread);
        t.start();

    }

}
