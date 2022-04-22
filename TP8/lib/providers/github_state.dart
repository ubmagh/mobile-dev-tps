
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';



class GithubDataProvider extends ChangeNotifier{

  List<dynamic> data=[
    {
      "avatar_url": "https://avatars.githubusercontent.com/u/50097565?v=4",
      "url": "https://api.github.com/users/ubmagh",
      "login": "ubmagh",
      "avatar_url": "https://avatars.githubusercontent.com/u/50097565?v=4",
      "html_url": "https://github.com/ubmagh"
    }
  ];

  String username="";
  String url="";

  void setUsername( String newUsername){
    username = newUsername;
    notifyListeners();
  }

  void setUrl( String newURl){
    url = newURl;
    notifyListeners();
  }

  void searchGithubUser(String userKey) {
    String url =
        "https://api.github.com/search/users?q=$userKey&per_page=10&page=0";
    http.get(Uri.parse(url)).then((response) {
        var data = json.decode(response.body);
        this.data = data == null || data["items"] == null? []:data["items"];
        notifyListeners();
    }).catchError((onError) {
      log("==> url :"+onError.toString());

      Fluttertoast.showToast(
          msg: "Can't query data with GitHub Api, there could be an error !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

}