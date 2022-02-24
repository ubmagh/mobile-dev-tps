package me.ubmagh.inline_calculator;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaCas;
import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.google.android.material.textfield.TextInputLayout;

import net.objecthunter.exp4j.Expression;
import net.objecthunter.exp4j.ExpressionBuilder;
import net.objecthunter.exp4j.ValidationResult;

import java.util.EventListener;

public class MainActivity extends AppCompatActivity {

    private TextInputLayout textInputLayout;
    private Button button;
    private TextView resultTxt;
    private LinearLayout resultLayout;
    private LinearLayout errorLayout;

    private LinearLayout calculLayout;
    private LinearLayout infosLayout;
    private Button infosBTN;
    private Button calculBTN;
    private boolean switchBool=true;
    private TextView link;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        link = (TextView) findViewById(R.id.link);
        link.setMovementMethod(LinkMovementMethod.getInstance());

        textInputLayout = (TextInputLayout) findViewById(R.id.operationInput);
        button = (Button) findViewById(R.id.button);
        resultTxt = (TextView) findViewById(R.id.result);
        resultLayout = (LinearLayout) findViewById(R.id.resultLayout);
        errorLayout = (LinearLayout) findViewById(R.id.errorLayout);

        calculLayout = (LinearLayout) findViewById( R.id.calculLayout );
        infosLayout = (LinearLayout) findViewById( R.id.infosLayout );
        infosBTN = (Button) findViewById(R.id.infosBTN);
        calculBTN = (Button) findViewById(R.id.calculBTN);

        button.setOnClickListener( view -> {
            try{
                Expression e = new ExpressionBuilder( textInputLayout.getEditText().getText().toString() ).build();
                ValidationResult res = e.validate();
                if( res.isValid() ){
                    errorLayout.setVisibility(View.GONE);
                    resultTxt.setText( e.evaluate()+"" );
                    resultLayout.setVisibility(View.VISIBLE);
                }else{
                    resultLayout.setVisibility(View.GONE);
                    resultTxt.setText( "" );
                    errorLayout.setVisibility(View.VISIBLE);
                }
            }catch(Exception exc){
                resultLayout.setVisibility(View.GONE);
                resultTxt.setText( "" );
                errorLayout.setVisibility(View.VISIBLE);
            }
        } );

        View.OnClickListener listener = view -> {
            if( switchBool ){
                // switch to infos Layout
                infosLayout.setVisibility(View.VISIBLE);
                infosBTN.setVisibility(View.GONE);
                calculBTN.setVisibility(View.VISIBLE);
                calculLayout.setVisibility(View.GONE);
            }else{
                // switch to calcul Layout
                infosLayout.setVisibility(View.GONE);
                infosBTN.setVisibility(View.VISIBLE);
                calculBTN.setVisibility(View.GONE);
                calculLayout.setVisibility(View.VISIBLE);
            }
            switchBool = !switchBool;
        };
        infosBTN.setOnClickListener(listener);
        calculBTN.setOnClickListener(listener);

    }
}