import 'package:bibiotheque_management/blocs/adherents/adherents.events.dart';
import 'package:bibiotheque_management/blocs/adherents/adherents.state.dart';
import 'package:bibiotheque_management/blocs/adherents/adhrents.bloc.dart';
import 'package:flutter/material.dart';
import 'package:bibiotheque_management/enums/request_state.enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdherentsPage extends StatelessWidget {
  AdherentsEvent adherentsEvent = GetAdherentsEvent();

  AdherentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adhérents"),
      ),
      body: Column(children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 26, bottom: 10, left: 8, right: 8),
            child: BlocBuilder<AdherentsBloc, AdherentsState>(
                builder: (context, state) {
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
                          context.read<AdherentsBloc>().add(adherentsEvent);
                        },
                        icon: const Icon(Icons.refresh),
                        color: Colors.deepOrange,
                        iconSize: 28)
                  ],
                ));
              }

              if (state.requestState == RequestState.Loaded) {
                if (state.adherents.isEmpty) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.info_sharp,
                                color: Colors.orange, size: 40),
                          ),
                          Text(" Aucun adhérent n'a été trouvé !",
                              style: TextStyle(
                                  fontSize: 29,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center),
                        ],
                      ));
                }

                return Expanded(
                  child: ListView.builder(
                      itemCount: state.adherents.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                  state.adherents[index].nom
                                          .toUpperCase()
                                          .substring(0, 1) +
                                      state.adherents[index].prenom
                                          .toUpperCase()
                                          .substring(0, 1),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              backgroundColor: Colors.green,
                            ),
                            title: Text(state.adherents[index].nom +
                                " " +
                                state.adherents[index].prenom),
                            subtitle: Text(
                                "email : " + state.adherents[index].email,
                                softWrap: true),
                            trailing: IconButton(
                                icon:
                                    const Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  adherentsEvent = DeleteAdherentEvent(
                                      adherent_id:
                                          state.adherents[index].id_adherent);
                                  context.read<AdherentsBloc>().add(
                                      DeleteAdherentEvent(
                                          adherent_id: state
                                              .adherents[index].id_adherent));
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
                            "cliquez sur le boutton pour charger les adhérents",
                            style:
                                TextStyle(fontSize: 19, color: Colors.black45),
                            textAlign: TextAlign.center)),
                    IconButton(
                        onPressed: () {
                          adherentsEvent = GetAdherentsEvent();
                          context
                              .read<AdherentsBloc>()
                              .add(GetAdherentsEvent());
                        },
                        icon: const Icon(Icons.arrow_circle_down,
                            size: 40, color: Colors.green))
                  ]);
            }))
      ]),
    );
  }
}
