import 'package:bibiotheque_management/blocs/adherents/adherents.state.dart';
import 'package:bibiotheque_management/blocs/adherents/adhrents.bloc.dart';
import 'package:bibiotheque_management/blocs/livres/livres.bloc.dart';
import 'package:bibiotheque_management/blocs/livres/livres.state.dart';
import 'package:bibiotheque_management/blocs/livres/livres.events.dart';
import 'package:bibiotheque_management/repositories/adhrent.repository.dart';
import 'package:bibiotheque_management/repositories/livre.repository.dart';
import 'package:bibiotheque_management/ui/pages/about.page.dart';
import 'package:bibiotheque_management/ui/pages/adherents.page.dart';
import 'package:bibiotheque_management/ui/pages/home.page.dart';
import 'package:bibiotheque_management/ui/pages/livres.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LivresBloc(initialState:  LivresInitialState(),livreRepository:  LivreRepository())  ),
          BlocProvider(create: (context)=>AdherentsBloc(initialState: AdherentsInitialState() , adherentRepository: AdherentRepository()))
        ],
        child: MaterialApp(
          title: 'Bibliothèque public (bpi)',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          routes: {
            "/" : (context)=>const HomePage(),
            "/livres": (context) => LivresPage(),
            "/adherents": (context) => AdherentsPage(),
            "/about": (context) => AboutPage()
          },
          initialRoute: "/",
        )
    );
  }
}
