import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tp7_apps/widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About this app"),
        ),
        body: Center(
          heightFactor: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.deepOrange,
                  size: 200,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Text(
                      "This app regroups a set of small apps, separated within pages.",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 20)),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Check this app repo throught the link bellow.",
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 18))),
                IconButton(
                  iconSize: 40,
                    onPressed: () async {
                      if (!await launch("https://github.com/ubmagh/mobile-dev-tps/tree/main/TP7")) {
                        Fluttertoast.showToast(
                            msg: "Can't open link To repository!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    icon: const Icon(Icons.link,
                        size: 40, color: Colors.deepPurple))
              ],
            ),
          ),
        ));
  }
}
