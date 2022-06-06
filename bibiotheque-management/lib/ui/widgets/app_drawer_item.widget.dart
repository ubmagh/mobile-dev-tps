import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String route;
  String title;
  IconData icon;

  DrawerItem(this.title, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        child: ListTile(
          style: ListTileStyle.drawer,
          onTap: () {
            if (route == "/") {
              Navigator.of(context).pop();
              Navigator.popUntil(context, (route) => route.isFirst);
            } else {
              Navigator.pushNamed(context, route);
            }
          },
          leading: CircleAvatar(
            child: CircleAvatar(child: Icon(icon)),
          ),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
