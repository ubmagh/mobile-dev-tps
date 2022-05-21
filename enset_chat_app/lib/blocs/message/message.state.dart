import 'package:enset_chat_app/blocs/message/messages.event.dart';
import 'package:enset_chat_app/models/message.model.dart';
import 'package:enset_chat_app/enums/requestState.enum.dart';

class MessageState{
  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  MessageEvent currentEvent;
  MessageState({required this.messages, this.requestState=RequestState.None, this.errorMessage="",required this.currentEvent});
}