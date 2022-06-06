import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("A propos (about)")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                child: Text(" BPi : bibliothèque publique d'informations ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        shadows: [
                          Shadow(
                              color: Colors.black45,
                              blurRadius: 20,
                              offset: Offset(5, 8))
                        ],
                        color: Colors.black)),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 14, right: 14, bottom: 35),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Row(
          children: const [
            Padding(
                padding: EdgeInsets.only(left: 10, bottom: 15),
                child: Text(" Créée par : ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w300)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Flexible(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("Ayoub MAGHDAOUI",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w200,
                          fontSize: 26,
                          shadows: [
                            Shadow(
                                color: Colors.purple,
                                offset: Offset(4, 14),
                                blurRadius: 14)
                          ]))),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 85,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 38),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only( top: 8.0, bottom: 20),
                child: OutlinedButton(
                    onPressed: () async {
                      if (!await launch("https://github.com/ubmagh")) {
                        Fluttertoast.showToast(
                            msg: "Erreur à l'overture du lien !",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 8, bottom: 8),
                      child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: const [
                            Icon(Icons.link),
                            Text("Visiter GitHub")
                          ]),
                    )),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only( top: 8.0, bottom: 20),
              child: OutlinedButton(
                  onPressed: () async {
                    if (!await launch("https://www.linkedin.com/in/ayoub-maghdaoui/")) {
                      Fluttertoast.showToast(
                          msg: "Erreur à l'overture du lien !",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 8, bottom: 8),
                    child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Icon(Icons.link),
                          Text("Visiter LinkedIn")
                        ]),
                  )),
            )
          ],
        )
      ]),
    );
  }
}
