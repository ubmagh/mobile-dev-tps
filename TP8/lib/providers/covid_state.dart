
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class CovidDataProvider extends ChangeNotifier{

  String keyword = "Morocco";

  var stats;
  var data;

  CovidDataProvider(){
    getStats();
  }


  void setKeyword( String keyword){
    this.keyword = keyword;
    notifyListeners();
  }


  getStats() {
    String url = "https://covid-api.mmediagroup.fr/v1/cases";
    http.get(Uri.parse(url)).then((response) {
        Map _json = json.decode(response.body);
        data=[];
        _json.values.forEach((element) {
          if( element!=null && element["All"]!=null ) {
            data.add(element);
          }
        });
        searchCountry();
    }).catchError((onError) {
      print("Error while calling the api ==> " + onError.toString());
      Fluttertoast.showToast(
          msg: "Can't query data with Covid-19 Api, there could be an error !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void searchCountry() {
    if( data !=null && (data as List).isNotEmpty) {
      stats = [];
      (data as List).forEach((element) {
        if (
        element["All"]["country"].toString().toLowerCase().contains(keyword.toLowerCase())
            ||
            element["All"]["abbreviation"].toString().toLowerCase().contains(keyword.toLowerCase())
        ) {
          (stats as List).add(element);
        }
      });
    }
    notifyListeners();

  }


}