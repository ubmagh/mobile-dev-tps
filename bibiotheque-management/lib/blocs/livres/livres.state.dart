

import 'package:bibiotheque_management/blocs/livres/livres.events.dart';
import 'package:bibiotheque_management/enums/request_state.enum.dart';
import 'package:bibiotheque_management/models/livre.model.dart';

class LivresState{
  List<Livre> livres;
  RequestState requestState;
  String errorMessage;
  LivresEvents currentEvent;
  LivresState({required this.livres, this.requestState=RequestState.None, this.errorMessage="",required this.currentEvent});
}


class LivresInitialState extends LivresState {
  LivresInitialState():super( livres: [], requestState: RequestState.None, currentEvent: GetLivresEvent(), errorMessage: "");
}
