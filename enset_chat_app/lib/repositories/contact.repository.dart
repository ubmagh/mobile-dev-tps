
import 'dart:math';

import 'package:enset_chat_app/models/contact.model.dart';

class ContactRepository {

  List<Contact> contacts = [

    Contact(id: 1, name: "Ayoub", group: "BDCC", profile: "ubmagh", email: "ayoub@ayoub.me", lastMessage: "Hello", lastMessageDate: "11/05/2022"),
    Contact(id: 2, name: "Ahmed", group: "GLSID", profile: "ahmed", email: "ahmed@ahmed.me", lastMessage: "Hello", lastMessageDate: "09/05/2022"),
    Contact(id: 3, name: "Ali", group: "BDCC", profile: "ali", email: "ali@ali.me", lastMessage: "Hello", lastMessageDate: "01/05/2022"),
    Contact(id: 4, name: "Jamal", group: "BDCC", profile: "jamal", email: "ali@ali.me", lastMessage: "Hello", lastMessageDate: "20/04/2022"),
    Contact(id: 5, name: "Kamal", group: "GLSID", profile: "kamal", email: "kamal@kamal.me", lastMessage: "", lastMessageDate: ""),
    Contact(id: 6, name: "Imane", group: "GLSID", profile: "imane", email: "imane@imane.me", lastMessage: "", lastMessageDate: ""),
    Contact(id: 7, name: "Jamila", group: "BDCC", profile: "jamila", email: "jamila@jamila.me", lastMessage: "", lastMessageDate: ""),
    Contact(id: 8, name: "Rachid", group: "GLSID", profile: "rachid", email: "rachid@rachid.me", lastMessage: "", lastMessageDate: ""),

  ];

  Future<List<Contact>> getAllContacts() async {
    var future = await Future.delayed(const Duration(seconds: 2));
    int rand = Random().nextInt(10);
    if( rand>5) {
      throw Exception("Kind of error happened 0x33 !");
    }
    return contacts;
  }

  Future<List<Contact>> getContactsByGroup( String group) async{
    var future = await Future.delayed(const Duration(seconds: 2));
    int rand = Random().nextInt(10);
    if( rand>5) {
      throw Exception("Kind of error happened 0x33 !");
    }
    var groupeContacts = contacts.where((element) => element.group==group).toList();
    return groupeContacts;
  }

}