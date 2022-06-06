import 'package:bibiotheque_management/ui/widgets/app_drawer.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Page d'acceuil")),
      body: const Center(
        child: Text("Acceuil"),
      ),
      drawer: AppDrawer(),
    );
  }
}



