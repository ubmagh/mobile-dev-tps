import 'package:enset_chat_app/blocs/contact/contact.bloc.dart';
import 'package:enset_chat_app/blocs/contact/contact.state.dart';
import 'package:enset_chat_app/blocs/message/message.bloc.dart';
import 'package:enset_chat_app/blocs/message/message.state.dart';
import 'package:enset_chat_app/blocs/message/messages.event.dart';
import 'package:enset_chat_app/models/contact.model.dart';
import 'package:enset_chat_app/repositories/contact.repository.dart';
import 'package:enset_chat_app/repositories/message.repository.dart';
import 'package:enset_chat_app/ui/pages/contacts.page.dart';
import 'package:enset_chat_app/ui/pages/message.page.dart';
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
          BlocProvider(create: (context) => ContactBloc( ContactInitialState(), ContactRepository())  ),
          BlocProvider(create: (context)=>MessageBloc(initialState: MessageState(messages: [],currentEvent: ContactMessageEvent(contact: Contact(id: 0, email: "", group: "", lastMessage: "", lastMessageDate: "", name: "", profile: ""))), messageRepository: MessageRepository()),)
        ],
        child: MaterialApp(
          title: 'Chat app',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          routes: {
            // "/" : null,
            "/contacts": (context) => ContactsPage(),
            "/messages": (context) => MessagesPage()
          },
          initialRoute: "/contacts",
        )
    );
  }
}
