import 'dart:ui';

import 'package:bibiotheque_management/blocs/livres/livres.bloc.dart';
import 'package:bibiotheque_management/blocs/livres/livres.events.dart';
import 'package:bibiotheque_management/blocs/livres/livres.state.dart';
import 'package:bibiotheque_management/enums/request_state.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LivresPage extends StatelessWidget {
  LivresEvents livresEvent=GetLivresEvent();

  LivresPage({Key? key}) : super(key: key);
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Livres"),
      ),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10.0, left: 5, right: 5, bottom: 6),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.book, color: Colors.deepOrange),
                      hintText: " Chercher un livre par mot clé ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  controller: textController,
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (textController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Saisissez un mot clé d'abord !",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      livresEvent = SearchLivresEvent(keyword: textController.text);
                      context
                          .read<LivresBloc>()
                          .add(SearchLivresEvent(keyword: textController.text));
                    }
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.green,
                  ))
            ],
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.only(top: 26, bottom: 10, left: 8, right: 8),
            child:
                BlocBuilder<LivresBloc, LivresState>(builder: (context, state) {
              if (state.requestState == RequestState.Loading) {
                return const Center(
                    child: SizedBox(
                        child: CircularProgressIndicator(color: Colors.green),
                        height: 70.0,
                        width: 70.0));
              }
              if (state.requestState == RequestState.Error) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Title(
                        color: Colors.red,
                        child: const Icon(Icons.error,
                            size: 70, color: Colors.red)),
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
                          context.read<LivresBloc>().add(livresEvent);
                        },
                        icon: const Icon(Icons.refresh),
                        color: Colors.deepOrange,
                        iconSize: 28)
                  ],
                ));
              }

              if (state.requestState == RequestState.Loaded) {
                if (state.livres.isEmpty) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.info_sharp,
                                color: Colors.orange, size: 40),
                          ),
                          const Text(" Aucun livre n'a été trouvé !",
                              style: TextStyle(
                                  fontSize: 29,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center),
                          textController.text.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: OutlinedButton(
                                      onPressed: () {
                                        context
                                            .read<LivresBloc>()
                                            .add(GetLivresEvent());
                                        livresEvent = GetLivresEvent();
                                        textController.text = "";
                                      },
                                      child: Wrap(children: const [
                                        Icon(Icons.close, color: Colors.orange),
                                        Text("Annuler la recherche",
                                            style:
                                                TextStyle(color: Colors.orange),

                                        )
                                      ])),
                                )
                              : Row()
                        ],
                      ));
                }

                return Expanded(
                  child: ListView.builder(
                      itemCount: state.livres.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ListTile(
                            leading: const Icon(Icons.book,
                                color: Colors.green, size: 30),
                            title: Text(state.livres[index].titre),
                            subtitle: Text(
                                state.livres[index].isbn +
                                    " | auteur : " +
                                    state.livres[index].auteur,
                                softWrap: true),
                            trailing: IconButton(
                                icon:
                                    const Icon(Icons.close, color: Colors.red),
                                onPressed: () {

                                  livresEvent =  DeleteLivreEvent(
                                      livre_id:
                                      state.livres[index].id_livre);
                                  context.read<LivresBloc>().add(
                                      DeleteLivreEvent(
                                          livre_id:
                                              state.livres[index].id_livre));
                                }),
                          ),
                        );
                      }),
                );
              }

              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                            "cliquez sur le boutton pour charger les données",
                            style:
                                TextStyle(fontSize: 19, color: Colors.black45),
                            textAlign: TextAlign.center)),
                    IconButton(
                        onPressed: () {
                          context.read<LivresBloc>().add(GetLivresEvent());
                          livresEvent = GetLivresEvent();
                        },
                        icon: const Icon(Icons.arrow_circle_down,
                            size: 40, color: Colors.green))
                  ]);
            }))
      ]),
    );
  }
}
