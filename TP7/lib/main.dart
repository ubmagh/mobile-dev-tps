import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp7_apps/pages/about.dart';
import 'package:tp7_apps/pages/contacts.dart';
import 'package:tp7_apps/pages/covid.dart';
import 'package:tp7_apps/pages/github_users.dart';
import 'package:tp7_apps/pages/home.dart';
import 'package:tp7_apps/pages/news.dart';
import 'package:tp7_apps/pages/weather.dart';
import 'package:tp7_apps/providers/weather_state.dart';
void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => (WeatherDataProvider()))
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        routes: {
          "/":(context)=>Home(),
          "/contacts":(context)=>Contacts(),
          "/github_users":(context)=>GitHubUsers(),
          "/news":(context)=>News(),
          "/covid":(context)=>Covid(),
          "/weather":(context)=>Weather(),
          "/about":(context)=>About(),
        },

      ),
    );
  }

}