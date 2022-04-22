import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

String dateFormat(DateTime dateTime) {
  return dateTime.year.toString() +
      "-" +
      dateTime.month.toString() +
      "-" +
      dateTime.day.toString();
}

class NewsDataProvider extends ChangeNotifier {
  String selectedDate = dateFormat(DateTime.now());
  List<dynamic> data = [];
  String url = "";
  String title = "";


  NewsDataProvider() {
    searchNews("Morocco");
  }

  void setUrl(String newUrl) {
    url = newUrl;
    notifyListeners();
  }

  void setTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  void setSelectedDate(String newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  void searchNews(String keyword) {
    String apiKey = "66fb23fd26da41caad412c194c9d878b";
    String url =
        "https://newsapi.org/v2/everything?q=$keyword&from=$selectedDate&sortBy=publishedAt&apiKey=" +
            apiKey;
    log("url : "+url);
    http.get(Uri.parse(url)).then((response) {
      var raw_data = json.decode(response.body);
      data = raw_data == null || raw_data["articles"] == null
          ? []
          : raw_data["articles"];
      notifyListeners();
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: "Can't query data with News Api, there could be an error !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
