import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DrawerItem extends StatelessWidget {
  String route;
  String title;
  IconData icon;

  DrawerItem(this.title, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ListTile(
        style: ListTileStyle.drawer,
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          child: CircleAvatar(
            child: Icon(icon, color: Colors.white),
          ),
        ),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
