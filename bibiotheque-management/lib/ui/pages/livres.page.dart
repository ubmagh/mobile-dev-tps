
import 'package:bibiotheque_management/blocs/livres/livres.events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LivresPage extends StatelessWidget {

  LivresEvents? livresEvent;

  LivresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Livres"),
      ),
      body: Column(

      ),
    );
  }
}
