import 'dart:math';

import 'package:enset_chat_app/models/message.model.dart';

class MessageRepository {
  List<Message> messages = [
    Message(id: 1, content: "Bonjour Ayoub", idContact: 1, sent: true),
    Message(id: 2, content: "Bonjour! cv ?", idContact: 1, sent: false),
    Message(id: 7, content: "Oui cv Alhamdolillah, et toi ?", idContact: 1, sent: true),
    Message(id: 3, content: "Bonsoir ", idContact: 2, sent: true),
    Message(id: 4, content: "Tout va bien !!", idContact: 2, sent: true),
    Message(id: 5, content: "Salut", idContact: 2, sent: false),
    Message(id: 6, content: "Je vais bien", idContact: 2, sent: false),
    Message(id: 8, content: "Moi aussi Alhamdolillah, merci", idContact: 1, sent: false),
  ];

  Future<List<Message>> messagesByContact(int idContact) async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if (rand > 2) {
      return messages
          .where((element) => element.idContact == idContact)
          .toList();
    } else {
      throw Exception("Erreur de chargement des messages");
    }
  }
}
