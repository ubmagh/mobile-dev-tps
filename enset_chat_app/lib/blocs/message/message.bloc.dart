import 'package:bloc/bloc.dart';
import 'package:enset_chat_app/blocs/contact/contact.state.dart';
import 'package:enset_chat_app/blocs/message/message.state.dart';
import 'package:enset_chat_app/blocs/message/messages.event.dart';
import 'package:enset_chat_app/enums/requestState.enum.dart';
import 'package:enset_chat_app/models/message.model.dart';
import 'package:enset_chat_app/repositories/message.repository.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository messageRepository;

  MessageBloc(
      {required MessageState initialState, required this.messageRepository})
      : super(initialState) {
    on<ContactMessageEvent>((event, emit) async {
        emit(MessageState(
            messages: [],
            requestState: RequestState.Loading,
            currentEvent: event));
        try {
          List<Message> messages =
              await messageRepository.messagesByContact(event.contact.id);
          emit(MessageState(
              messages: messages,
              requestState: RequestState.Loaded,
              currentEvent: event));
        } catch (e) {
          emit(MessageState(
              messages: [],
              requestState: RequestState.Error,
              errorMessage: e.toString(),
              currentEvent: event));
        }
    });
  }
}
