

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
                radius: 55,
              ),
              SizedBox(height: 5,),
              Text("Tony stark"),

            ],
          ),
          ),
          const Divider(height: 5,color: Colors.black,)
          ,
          ListTile(
            title: const Text("Home"),
            onTap: (){
              Navigator.pushNamed(context, "/");
            },
          ),
          ListTile(
            title: const Text("Messaging"),
            onTap: (){
              Navigator.pushNamed(context, "/contacts");
            },
          )],
      ),
    );
  }
}


