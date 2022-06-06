import 'dart:ui';

import 'package:bibiotheque_management/ui/widgets/app_drawer.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Page d'acceuil")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Banque publique d'information (Bpi) ", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 30), textAlign: TextAlign.center),
          const Padding(
              padding: EdgeInsets.only( top: 25),
              child: Text("une application pour gérer les livres et les adhérents d'une bibliothèque.", textAlign: TextAlign.center
              , style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 16))
          ),
          Padding(
              padding: const EdgeInsets.only(top:60, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    OutlinedButton(onPressed: (){
                      Navigator.pushNamed(context, "/adherents");
                    }, child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(13.0),
                          child: Icon( Icons.person, size: 28),
                        ),
                        Padding(
                          padding: EdgeInsets.only( right: 10.0, left: 10.0, bottom: 10.0),
                          child: Text( "Adhérents ", textAlign: TextAlign.center),
                        )
                      ],
                    )),
                  const SizedBox(width: 20),
                  OutlinedButton(onPressed: (){
                    Navigator.pushNamed(context, "/livres");
                  }, child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only( top: 13.0, bottom: 13.0, left: 16.0, right: 16.0 ),
                        child: Icon( Icons.book, size: 28),
                      ),
                      Padding(
                        padding: EdgeInsets.only( right: 16.0, left: 16.0, bottom: 10.0),
                        child: Text( "Livres", textAlign: TextAlign.center),
                      )
                    ],
                  ))
                ]
              ),
          )
        ]
      ),
      drawer: const AppDrawer(),
    );
  }
}



