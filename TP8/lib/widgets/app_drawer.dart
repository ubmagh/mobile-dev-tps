import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp8_apps/widgets/drawer_item.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  String currentRoute="Home";

  setCurrentRoute(String route){
    setState(() {
      currentRoute=route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepOrange,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 60,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/profil.jpg"),
                  ),
                ),
                Text("Tony Stark",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 25)),
              ],
            ),
            padding: const EdgeInsets.only(bottom: 7),
            margin: const EdgeInsets.only(top: 15, bottom: 9),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                DrawerItem("Home", "/", Icons.home),
                DrawerItem("Contacts", "/contacts", Icons.contacts_outlined),
                DrawerItem("Github Users", "/github_users", Icons.people_outline),
                DrawerItem("News", "/news", Icons.newspaper_outlined),
                DrawerItem("Covid 19", "/covid", Icons.bug_report_outlined),
                DrawerItem("Weather", "/weather", Icons.wb_sunny_outlined),
                DrawerItem("About", "/about", Icons.error_outline_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
