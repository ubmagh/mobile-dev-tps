
import 'package:bibiotheque_management/ui/widgets/app_drawer_item.widget.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: const [
              CircleAvatar(
                radius: 45,
                child: Text("BPi", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700)),
                backgroundColor: Colors.deepOrange,
              ),
              SizedBox(height: 5,),
              Text("Bibliothèque publique"),
            ],
          ),
          ),
          const Divider(height: 8,color: Colors.black),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 5, right: 8),
            child: Column(
              children: [
                DrawerItem( "Acceuil", "/", Icons.home),
                DrawerItem( "Livres", "/livres", Icons.book),
                DrawerItem( "Adhérents", "/adherents", Icons.person),
                DrawerItem( "à propos", "/about", Icons.info),
              ],
            ),
          )
        ],
      ),
    );
  }
}



