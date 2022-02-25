package me.ubmagh.inline_calculator;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.google.android.material.textfield.TextInputLayout;

import net.objecthunter.exp4j.Expression;
import net.objecthunter.exp4j.ExpressionBuilder;
import net.objecthunter.exp4j.ValidationResult;

public class MainActivity extends AppCompatActivity {

    private TextInputLayout textInputLayout;
    private TextView resultTxt;
    private LinearLayout resultLayout;
    private LinearLayout errorLayout;


    private TextView link;
    private Button btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9;
    private Button clearBTN, absBTN, cosBTN, sinBTN, divBTN, multBTN, sousBTN, plusBTN, eqBTN, openp, closep;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        link = (TextView) findViewById(R.id.link);
        link.setMovementMethod(LinkMovementMethod.getInstance());

        textInputLayout = (TextInputLayout) findViewById(R.id.operationInput);
        resultTxt = (TextView) findViewById(R.id.result);
        resultLayout = (LinearLayout) findViewById(R.id.resultLayout);
        errorLayout = (LinearLayout) findViewById(R.id.errorLayout);

        btn0 = (Button) findViewById( R.id.btn0 );
        btn1 = (Button) findViewById( R.id.btn1 );
        btn2 = (Button) findViewById( R.id.btn2 );
        btn3 = (Button) findViewById( R.id.btn3 );
        btn4 = (Button) findViewById( R.id.btn4 );
        btn5 = (Button) findViewById( R.id.btn5 );
        btn6 = (Button) findViewById( R.id.btn6 );
        btn7 = (Button) findViewById( R.id.btn7 );
        btn8 = (Button) findViewById( R.id.btn8 );
        btn9 = (Button) findViewById( R.id.btn9 );

        clearBTN = (Button) findViewById( R.id.clearbtn );
        absBTN = (Button) findViewById( R.id.absbtn );
        cosBTN = (Button) findViewById( R.id.cosbtn );
        sinBTN = (Button) findViewById( R.id.sinbtn );
        divBTN = (Button) findViewById( R.id.divBTN );
        multBTN = (Button) findViewById( R.id.multBTN );
        sousBTN = (Button) findViewById( R.id.sousBTN );
        plusBTN = (Button) findViewById( R.id.plusBTN );
        eqBTN = (Button) findViewById( R.id.eqbtn );
        openp = (Button) findViewById( R.id.openpbtn );
        closep = (Button) findViewById( R.id.closepbtn );


        EditText text =  textInputLayout.getEditText();

        View.OnClickListener basicClickListener = new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Button b = (Button) view;
                text.setText( text.getText().toString()+ b.getText().toString() );
            }
        };
        btn0.setOnClickListener( basicClickListener );
        btn1.setOnClickListener( basicClickListener );
        btn2.setOnClickListener( basicClickListener );
        btn3.setOnClickListener( basicClickListener );
        btn4.setOnClickListener( basicClickListener );
        btn5.setOnClickListener( basicClickListener );
        btn6.setOnClickListener( basicClickListener );
        btn7.setOnClickListener( basicClickListener );
        btn8.setOnClickListener( basicClickListener );
        btn9.setOnClickListener( basicClickListener );
        openp.setOnClickListener( basicClickListener );
        closep.setOnClickListener( basicClickListener );
        divBTN.setOnClickListener( basicClickListener );
        multBTN.setOnClickListener( basicClickListener );
        sousBTN.setOnClickListener( basicClickListener );
        plusBTN.setOnClickListener( basicClickListener );


        absBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Button b = (Button) view;
                text.setText( text.getText().toString()+ "abs(");
            }
        });

        cosBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Button b = (Button) view;
                text.setText( text.getText().toString()+ "cos(");
            }
        });

        sinBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Button b = (Button) view;
                text.setText( text.getText().toString()+ "sin(");
            }
        });

        clearBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Button b = (Button) view;
                text.setText("");
                resultLayout.setVisibility(View.GONE);
                errorLayout.setVisibility(View.GONE);
            }
        });

        eqBTN.setOnClickListener( view -> {
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

    }
}