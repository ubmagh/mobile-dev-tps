part of 'contacts_bloc.dart';

abstract class ContactsEvent {
  const ContactsEvent();
}

class ContactAddEvent extends ContactsEvent{
  String contactName;
  ContactAddEvent(this.contactName);
}
class ContactDeleteEvent extends ContactsEvent{
  int index;
  ContactDeleteEvent(this.index);
}
