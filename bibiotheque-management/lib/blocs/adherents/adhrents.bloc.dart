import 'package:bibiotheque_management/blocs/adherents/adherents.events.dart';
import 'package:bibiotheque_management/blocs/adherents/adherents.state.dart';
import 'package:bibiotheque_management/enums/request_state.enum.dart';
import 'package:bibiotheque_management/models/adherent.model.dart';
import 'package:bibiotheque_management/repositories/adhrent.repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdherentsBloc extends Bloc<AdherentsEvent, AdherentsState> {
  AdherentRepository adherentRepository;

  AdherentsBloc(
      {required AdherentsState initialState, required this.adherentRepository})
      : super(initialState) {
    // on get all adherents event
    on<GetAdherentsEvent>((event, emit) async {
      emit(AdherentsState(
          adherents: [],
          requestState: RequestState.Loading,
          currentEvent: event));
      try {
        List<Adherent> adherents = await adherentRepository.allAdherents();
        emit(AdherentsState(
            adherents: adherents,
            requestState: RequestState.Loaded,
            currentEvent: event));
      } catch (e) {
        emit(AdherentsState(
            adherents: [],
            requestState: RequestState.Error,
            errorMessage: e.toString(),
            currentEvent: event));
      }
    });

    // on delete an adherent event
    on<DeleteAdherentEvent>((event, emit) async {
      emit(AdherentsState(
          adherents: [],
          requestState: RequestState.Loading,
          currentEvent: event));
      try {
        adherentRepository.deleteAdherent(event.adherent_id).then((value) {
          Fluttertoast.showToast(
              msg: value
                  ? "Adherent bien supprimé !"
                  : "Erreur, l'adherent n'est pas supprimé !",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: value ? Colors.green : Colors.deepOrange,
              textColor: Colors.white,
              fontSize: 16.0);
        });
        List<Adherent> messages = await adherentRepository.allAdherents();
        emit(AdherentsState(
            adherents: messages,
            requestState: RequestState.Loaded,
            currentEvent: event));
      } catch (e) {
        emit(AdherentsState(
            adherents: [],
            requestState: RequestState.Error,
            errorMessage: e.toString(),
            currentEvent: event));
        Fluttertoast.showToast(
            msg: "Erreur, l'adherent n'est pas supprimé ! \n erreur : "+e.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.deepOrange,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }
}
