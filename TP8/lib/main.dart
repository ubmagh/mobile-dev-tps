import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp8_apps/pages/GithubProfileView.dart';
import 'package:tp8_apps/pages/NewsDetailsView.dart';
import 'package:tp8_apps/pages/about.dart';
import 'package:tp8_apps/pages/contacts.dart';
import 'package:tp8_apps/pages/covid.dart';
import 'package:tp8_apps/pages/github_users.dart';
import 'package:tp8_apps/pages/home.dart';
import 'package:tp8_apps/pages/news.dart';
import 'package:tp8_apps/pages/weather.dart';
import 'package:tp8_apps/providers/contacts_state.dart';
import 'package:tp8_apps/providers/covid_state.dart';
import 'package:tp8_apps/providers/github_state.dart';
import 'package:tp8_apps/providers/news_state.dart';
import 'package:tp8_apps/providers/weather_state.dart';
void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => (WeatherDataProvider())),
        ChangeNotifierProvider(create: (context) => (ContactsDataProvider())),
        ChangeNotifierProvider(create: (context) => (GithubDataProvider())),
        ChangeNotifierProvider(create: (context) => (NewsDataProvider())),
        ChangeNotifierProvider(create: (context) => (CovidDataProvider())),
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
          "/viewGithubProfile":(context)=>const GitHubProfileView(),
          "/newsDetailsView":(context)=>const NewsDetailsView(),
        },

      ),
    );
  }

}