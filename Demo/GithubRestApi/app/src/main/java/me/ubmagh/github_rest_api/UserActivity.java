package me.ubmagh.github_rest_api;

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

import me.ubmagh.github_rest_api.model.User;

public class UserActivity extends AppCompatActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_profile);
        Intent intent=getIntent();
        User user=(User)intent.getSerializableExtra("user");
        TextView usernameTextView=findViewById(R.id.textViewUserLogin);
        TextView scoreTextView=findViewById(R.id.score);
        ImageView imageView=findViewById(R.id.imageViewProfile);
        usernameTextView.setText(user.getLogin());
        scoreTextView.setText(" Score : "+user.getScore());

        Button goBackBtn = findViewById(R.id.goBackBtn);

        goBackBtn.setOnClickListener(view -> {
            this.finish();
        });

        Runnable thread= new Runnable(){
             @Override
             public void run() {
                 try {
                     Log.i("info",user.getAvatarUrl());
                    URL url=new URL(user.getAvatarUrl());
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
