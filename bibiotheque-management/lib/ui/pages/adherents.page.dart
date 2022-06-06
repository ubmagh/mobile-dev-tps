
import 'package:bibiotheque_management/blocs/adherents/adherents.events.dart';
import 'package:flutter/material.dart';

class AdherentsPage extends StatelessWidget {

  AdherentsEvent? adherentsEvent;

  AdherentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adhérents"),
      ),
      body: Column(
        
      ),
    );
  }
}
