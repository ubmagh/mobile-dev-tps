import 'package:bibiotheque_management/blocs/livres/livres.events.dart';
import 'package:bibiotheque_management/blocs/livres/livres.state.dart';
import 'package:bibiotheque_management/enums/request_state.enum.dart';
import 'package:bibiotheque_management/models/livre.model.dart';
import 'package:bibiotheque_management/repositories/livre.repository.dart';
import 'package:bloc/bloc.dart';

class LivresBloc extends Bloc<LivresEvents, LivresState> {
  LivreRepository livreRepository;

  LivresBloc( {required LivresState initialState, required this.livreRepository})
      : super(initialState) {

    // on get all livres event
    on<GetLivresEvent>((event, emit) async {
      emit(LivresState(
          livres: [],
          requestState: RequestState.Loading,
          currentEvent: event));
      try {
        List<Livre> livres =
        await livreRepository.allLivres();
        emit(LivresState(
            livres: livres,
            requestState: RequestState.Loaded,
            currentEvent: event));
      } catch (e) {
        emit(LivresState(
            livres: [],
            requestState: RequestState.Error,
            errorMessage: e.toString(),
            currentEvent: event));
      }
    });

    // on delete an livre event
    on<DeleteLivreEvent>((event, emit) async {
      emit(LivresState(livres: [],requestState: RequestState.Loading,currentEvent: event));
      try{
        livreRepository.deleteLivre(event.livre_id);
        List<Livre> messages=await livreRepository.allLivres();
        emit( LivresState(livres: messages,requestState: RequestState.Loaded,currentEvent: event));
      }catch(e){
        emit( LivresState(livres: [],requestState: RequestState.Error,errorMessage: e.toString(),currentEvent: event));
      }
    });

    // on search a livre event
    on<SearchLivresEvent>((event, emit) async {
      emit(LivresState(
          livres: [],
          requestState: RequestState.Loading,
          currentEvent: event));
      try {
        List<Livre> livres =
        await livreRepository.findLivres(event.keyword);
        emit(LivresState(
            livres: livres,
            requestState: RequestState.Loaded,
            currentEvent: event));
      } catch (e) {
        emit(LivresState(
            livres: [],
            requestState: RequestState.Error,
            errorMessage: e.toString(),
            currentEvent: event));
      }
    });

  }
}
