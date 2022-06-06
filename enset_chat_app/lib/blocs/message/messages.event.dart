import 'package:enset_chat_app/models/contact.model.dart';
import 'package:enset_chat_app/models/message.model.dart';

abstract class MessageEvent{}

class ContactMessageEvent extends MessageEvent{
  Contact contact;
  ContactMessageEvent({required this.contact});
}


class NewMessageEvent extends MessageEvent{
  Message message;
  NewMessageEvent({required this.message});
}

