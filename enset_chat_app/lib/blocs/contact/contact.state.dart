
import 'package:enset_chat_app/enums/requestState.enum.dart';
import 'package:enset_chat_app/models/contact.model.dart';


class ContactState {

  List<Contact> contacts = [];
  RequestState requestState;
  String errorMessage;

  ContactState({ required this.contacts, required this.requestState, required this.errorMessage});
  @override
  List<Object?> get props  => [ contacts, requestState, errorMessage];
}

class ContactInitialState extends ContactState {

  ContactInitialState() : super(contacts: [], errorMessage: "", requestState: RequestState.None);


}