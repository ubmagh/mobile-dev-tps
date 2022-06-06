import 'package:bibiotheque_management/blocs/adherents/adherents.events.dart';
import 'package:bibiotheque_management/blocs/adherents/adherents.state.dart';
import 'package:bibiotheque_management/enums/request_state.enum.dart';
import 'package:bibiotheque_management/models/adherent.model.dart';
import 'package:bibiotheque_management/repositories/adhrent.repository.dart';
import 'package:bloc/bloc.dart';

class AdherentsBloc extends Bloc<AdherentsEvent, AdherentsState> {
  AdherentRepository adherentRepository;

  AdherentsBloc( {required AdherentsState initialState, required this.adherentRepository})
      : super(initialState) {

    // on get all adherents event
    on<GetAdherentsEvent>((event, emit) async {
      emit(AdherentsState(
          adherents: [],
          requestState: RequestState.Loading,
          currentEvent: event));
      try {
        List<Adherent> adherents =
        await adherentRepository.allAdherents();
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
      emit(AdherentsState(adherents: [],requestState: RequestState.Loading,currentEvent: event));
      try{
        adherentRepository.deleteAdherent(event.adherent_id);
        List<Adherent> messages=await adherentRepository.allAdherents();
        emit(AdherentsState(adherents: messages,requestState: RequestState.Loaded,currentEvent: event));
      }catch(e){
        emit(AdherentsState(adherents: [],requestState: RequestState.Error,errorMessage: e.toString(),currentEvent: event));
      }
    });
  }
}
