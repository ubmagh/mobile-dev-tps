package me.ubmagh.infilestoringapp.models;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import me.ubmagh.infilestoringapp.R;
import java.util.List;



public class StudentAdapter extends ArrayAdapter<Student> {

    private int resource;
    public StudentAdapter(@NonNull Context context, int resource, @NonNull List<Student> studentList) {
        super( context, resource, studentList);
        this.resource=resource;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View listItemView=convertView;
        if(listItemView==null){
            listItemView= LayoutInflater.from( getContext()).inflate( resource, parent, false);
        }
        TextView fnametxtView= listItemView.findViewById( R.id.fnameLabel );
        TextView lnametxtView= listItemView.findViewById( R.id.lnameLabel );
        TextView idtxtView= listItemView.findViewById( R.id.idLabel );
        TextView bdtxtView= listItemView.findViewById( R.id.bdLabel );
        TextView classtxtView=listItemView.findViewById( R.id.classLabel );

        fnametxtView.setText( getItem(position).getFname() );
        lnametxtView.setText( getItem(position).getLname() );
        idtxtView.setText( getItem(position).getID() );
        bdtxtView.setText( getItem(position).getBirthDate() );
        classtxtView.setText( getItem(position).get_class() );

        return listItemView;
    }
}
