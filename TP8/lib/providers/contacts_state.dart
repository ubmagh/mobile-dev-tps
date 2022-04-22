
import 'package:flutter/cupertino.dart';

class ContactsDataProvider extends ChangeNotifier{

  var data=["ubmagh", "Any"];

  void addContact( String contact){
    this.data.add( contact);
    notifyListeners();
  }

  void removeAtIndex( int index){
    this.data.removeAt(index);
    notifyListeners();
  }

  void setData( var data){
    this.data = data;
    notifyListeners();
  }
}