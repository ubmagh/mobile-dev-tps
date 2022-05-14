import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Title(
            color: Colors.black,
            child: const Text("Getting started Examples ; ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/getting-started/bloc");
                },
                child: const Text("Using Bloc"),
                style: const ButtonStyle()),
            const SizedBox(width: 4),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/getting-started/cubit");
                },
                child: const Text("Using Cubit"),
                style: const ButtonStyle()),
          ]),
        ),
        Title(
            color: Colors.black,
            child: const Text(" applying on contacts management example ; ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700), textAlign: TextAlign.center)),
        Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/contacts-list-example");
                      },
                      child: const Text("Contacts list"),
                      style: const ButtonStyle()),
                ]))
      ]),
    );
  }
}
