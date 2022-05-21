
abstract class ContactEvent {
}

class LoadAllContactsEvent extends ContactEvent {}
class LoadContactsByGroupEvent extends ContactEvent{
  String groupe;
  LoadContactsByGroupEvent( this.groupe);
}

//class LoadBdccContactsEvent extends ContactEvent{}
//class LoadGlsidContactsEvent extends ContactEvent{}
// these events can be declared as an enumeration
