part of 'contacts_bloc.dart';

class ContactsState  {
  List<String> contacts;
  ContactsState({ required this.contacts});

  @override
  List<Object?> get props  => [contacts];
}

class ContactsInitial extends ContactsState {
  ContactsInitial() : super(contacts: []);

  @override
  List<Object?> get props  => [contacts];
}
