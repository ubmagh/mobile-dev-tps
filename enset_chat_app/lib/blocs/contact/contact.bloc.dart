
import 'package:enset_chat_app/blocs/contact/contact.event.dart';
import 'package:enset_chat_app/blocs/contact/contact.state.dart';
import 'package:enset_chat_app/enums/requestState.enum.dart';
import 'package:enset_chat_app/repositories/contact.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {

  ContactRepository contactRepository ; // TODO: DI later !
  String lastLoad= "";

  ContactBloc( ContactState contactState, this.contactRepository) : super(ContactInitialState()) {

    on<LoadAllContactsEvent>((event, emit) async {
      lastLoad = "all";
      emit( ContactState(requestState: RequestState.Loading, contacts: [], errorMessage: ""));
      await contactRepository.getAllContacts()
          .then((value) => emit(ContactState(contacts: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(ContactState(contacts: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

    on<LoadContactsByGroupEvent>((event, emit) async {
      lastLoad= event.groupe;
      emit( ContactState(requestState: RequestState.Loading, contacts: [], errorMessage: ""));
      await contactRepository.getContactsByGroup( event.groupe )
          .then((value) => emit(ContactState(contacts: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(ContactState(contacts: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

  }
}