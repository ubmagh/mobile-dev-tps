import 'package:bloc_in_state_management/list_example/contacts_bloc/contacts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactsPage extends StatelessWidget {
  ContactsPage({Key? key}) : super(key: key);

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Contacts management")),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  flex: 8,
                    child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.contacts),
                      hintText: "Enter contact name ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  controller: textController,
                )),
                Expanded(
                    child: IconButton(
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
                        context
                            .read<ContactsBloc>()
                            .add(ContactAddEvent(textController.text));
                        textController.text = "";
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.deepPurple,
                    ))
                ),
              ],
            ),
            Padding(
                padding:  const EdgeInsets.only(top: 13),
                child: BlocBuilder<ContactsBloc, ContactsState>(
                  builder: (context1, state) => ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Text(
                                  state.contacts[index].substring(0, 1))),
                          title: Text(state.contacts[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel_outlined),
                            color: Colors.red,
                            onPressed: () {
                              context
                                  .read<ContactsBloc>()
                                  .add(ContactDeleteEvent(index));
                            },
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true, // IDK WTH IS THIS
                    itemCount: state.contacts.length
                  )),
            )
          ]),
        ));
  }
}
