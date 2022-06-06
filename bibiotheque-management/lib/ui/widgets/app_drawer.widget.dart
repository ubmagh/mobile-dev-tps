
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
                radius: 55
              ),
              SizedBox(height: 5,),
              Text("Bibliothèque publique"),
            ],
          ),
          ),
          const Divider(height: 5,color: Colors.black,)
          ,
          ListTile(
            title: const Text("Acceuil"),
            onTap: (){
              Navigator.pushNamed(context, "/");
            },
          ),
          ListTile(
            title: const Text("Livres"),
            onTap: (){
              Navigator.pushNamed(context, "/livres");
            },
          ),
          ListTile(
            title: const Text("Adhérents"),
            onTap: (){
              Navigator.pushNamed(context, "/adherents");
            },
          ),
          ListTile(
            title: const Text("à propos"),
            onTap: (){
              Navigator.pushNamed(context, "/about");
            },
          )],
      ),
    );
  }
}



