import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tp8_apps/providers/contacts_state.dart';

class Contacts extends StatelessWidget {
  TextEditingController textController = TextEditingController();

  Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Consumer<ContactsDataProvider>(
        builder: (context, value, child) =>
            Text("Contacts (" + value.data.length.toString() + ")"),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.contacts),
                        hintText: "Enter new contact name ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    controller: textController,
                  ),
                ),
                Consumer<ContactsDataProvider>(
                    builder: (context, state, child) => IconButton(
                        onPressed: () {
                          if (textController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please enter a name firstly",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            state.addContact(textController.text);
                            textController.text = "";
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.deepOrange,
                        )))
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 7, right: 7),
                child: Consumer<ContactsDataProvider>(
                  builder: (context, contactsState, child) {
                    var data = contactsState.data;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text(data[index].substring(0, 1))),
                            title: Text(data[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              color: Colors.red,
                              onPressed: () {
                                contactsState.removeAtIndex(index);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
