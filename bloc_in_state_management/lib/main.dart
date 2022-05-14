import 'package:bloc_in_state_management/Home.dart';
import 'package:bloc_in_state_management/getting_started/bloc/counter/counter_bloc.dart';
import 'package:bloc_in_state_management/getting_started/bloc/counter_cubit.dart';
import 'package:bloc_in_state_management/getting_started/home_bloc_page.dart';
import 'package:bloc_in_state_management/getting_started/home_cubit_page.dart';
import 'package:bloc_in_state_management/list_example/ContactsPage.dart';
import 'package:bloc_in_state_management/list_example/contacts_bloc/contacts_bloc.dart';
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
        BlocProvider(create: (context)=>CounterCubit()),
        BlocProvider(create: (context)=>CounterBloc()),
        BlocProvider(create: (context)=>ContactsBloc()),

      ],
      child: MaterialApp(
        title: 'Bloc in state management',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routes: {
          "/": (context)=> const HomePage(),
          "/getting-started/bloc": (context)=> const BlocExamplePage(),
          "/getting-started/cubit": (context)=> const CubitExamplePage(),
          "/contacts-list-example":  (context) => ContactsPage()
        },
      ),
    );
  }
}
