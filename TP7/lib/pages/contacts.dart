import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Contacts extends StatefulWidget {
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  TextEditingController textController = new TextEditingController();

  List<String> data = ["ubmagh", "Any"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.contacts),
                        hintText: "Enter contact name ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    controller: textController,
                  ),
                ),
                IconButton(
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
                        setState(() {
                          data.add(textController.text);
                          textController.text = "";
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.deepOrange,
                    ))
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 7, right: 7),
                child: ListView.builder(
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
                            setState(() {
                              data.removeAt(index);
                            });
                          },
                        ),
                      ),
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
