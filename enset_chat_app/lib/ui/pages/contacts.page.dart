import 'dart:html';

import 'package:enset_chat_app/bloc/blocs/contact.bloc.dart';
import 'package:enset_chat_app/bloc/events/contact.event.dart';
import 'package:enset_chat_app/bloc/states/contact.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  ContactEvent? contactEvent;

  ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts "),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        contactEvent = LoadAllContactsEvent();
                        context.read<ContactBloc>().add(contactEvent!);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: context.read<ContactBloc>().lastLoad == "all"
                              ? Colors.orange
                              : Colors.yellow),
                      child: const Text("All")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        contactEvent = LoadContactsByGroupEvent("BDCC");
                        context.read<ContactBloc>().add(contactEvent!);
                      },
                      style: ElevatedButton.styleFrom(
                          primary:
                              context.read<ContactBloc>().lastLoad == "BDCC"
                                  ? Colors.orange
                                  : Colors.yellow),
                      child: const Text("BDCC")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        contactEvent = LoadContactsByGroupEvent("GLSID");
                        context.read<ContactBloc>().add(contactEvent!);
                      },
                      style: ElevatedButton.styleFrom(
                          primary:
                              context.read<ContactBloc>().lastLoad == "GLSID"
                                  ? Colors.orange
                                  : Colors.yellow),
                      child: const Text("GLSID")),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Center(
              child: Title(
                  color: Colors.black,
                  child: const Text("Contacts List :",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 28))),
            ),
          ),
          Expanded(child:
              BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
            if (state.requestState == RequestState.Loading) {
              return const Center(
                  child: SizedBox(
                      child:
                          CircularProgressIndicator(color: Colors.deepOrange),
                      height: 70.0,
                      width: 70.0));
            }
            if (state.requestState == RequestState.Loaded) {
              return ListView.separated(
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Divider(color: Colors.orange, thickness: 1),
                      ),
                  itemCount: state.contacts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child:
                              Text(state.contacts[index].name.substring(0, 1))),
                      title: Text(state.contacts[index].name),
                      subtitle: Text(
                          state.contacts[index].lastMessage.isNotEmpty
                              ? "Last message : " +
                                  state.contacts[index].lastMessage
                              : ""),
                      trailing: Text("Groupe : " + state.contacts[index].group),
                    );
                  });
            }
            if (state.requestState == RequestState.Error) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Title(
                      color: Colors.red,
                      child:
                          const Icon(Icons.error, size: 70, color: Colors.red)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 17.0),
                    child: Center(
                        child: Title(
                            color: Colors.red,
                            child: Text(state.errorMessage,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w100,
                                  shadows: [
                                    Shadow(
                                        color: Colors.deepOrange,
                                        offset: Offset(2, 13),
                                        blurRadius: 20)
                                  ],
                                )))),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<ContactBloc>().add(contactEvent!);
                      },
                      icon: const Icon(Icons.refresh),
                      color: Colors.deepOrange,
                      iconSize: 28)
                ],
              ));
            }
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Title(
                    color: Colors.teal,
                    child: const Icon(Icons.hourglass_empty,
                        size: 70, color: Colors.teal)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                      child: Title(
                          color: Colors.red,
                          child: const Text(
                              "(nothing..) Press a button to load data !",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 30,
                                fontWeight: FontWeight.w100,
                                shadows: [
                                  Shadow(
                                      color: Colors.blue,
                                      offset: Offset(7, 10),
                                      blurRadius: 19)
                                ],
                              )))),
                )
              ],
            ));
          }))
        ],
      ),
    );
  }
}
