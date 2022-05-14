import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsInitial()) {

    on<ContactAddEvent>((event, emit) {
      List<String> contacts = List.castFrom(state.contacts);
      contacts.add(event.contactName);
      emit(ContactsState(contacts: contacts ));
    });

    on<ContactDeleteEvent>((event, emit) {
      List<String> contacts = List.castFrom(state.contacts);
      contacts.removeAt(event.index);
      emit(ContactsState(contacts: contacts ));
    });

  }
}
