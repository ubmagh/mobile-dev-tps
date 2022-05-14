import 'package:enset_chat_app/bloc/blocs/contact.bloc.dart';
import 'package:enset_chat_app/bloc/states/contact.state.dart';
import 'package:enset_chat_app/repositories/contact.repository.dart';
import 'package:enset_chat_app/ui/pages/contacts.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ContactBloc( ContactInitialState(), ContactRepository())  )
        ],
        child: MaterialApp(
          title: 'Chat app',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          routes: {
            // "/" : null,
            "/contacts": (context) => ContactsPage()
          },
          initialRoute: "/contacts",
        )
    );
  }
}
