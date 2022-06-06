
import 'package:bibiotheque_management/blocs/adherents/adherents.events.dart';
import 'package:bibiotheque_management/enums/request_state.enum.dart';
import 'package:bibiotheque_management/models/adherent.model.dart';

class AdherentsState{
  List<Adherent> adherents;
  RequestState requestState;
  String errorMessage;
  AdherentsEvent currentEvent;
  AdherentsState({required this.adherents, this.requestState=RequestState.None, this.errorMessage="",required this.currentEvent});
}

class AdherentsInitialState extends AdherentsState {
  AdherentsInitialState():super( adherents: [], requestState: RequestState.None, errorMessage: "", currentEvent: GetAdherentsEvent() );
}

