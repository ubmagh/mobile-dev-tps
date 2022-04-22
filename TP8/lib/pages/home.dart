import 'package:flutter/material.dart';
import 'package:tp8_apps/widgets/app_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Center(
          heightFactor: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: const [
                Icon(
                  Icons.subdirectory_arrow_left_outlined,
                  color: Colors.deepOrange,
                  size: 200,
                ),
                Text(" Check apps on the left panel",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 26))
              ],
            ),
          ),
        ));
  }
}
