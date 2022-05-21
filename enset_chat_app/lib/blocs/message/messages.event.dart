import 'package:enset_chat_app/models/contact.model.dart';

abstract class MessageEvent{}

class ContactMessageEvent extends MessageEvent{
  Contact contact;
  ContactMessageEvent({required this.contact});
}