import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  List<String> contacts = ["Ali", "Ahmed", "Jaafer"];

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    void deleteItem(int index) {
      print("deleted");
      contacts.removeAt(index);
    }

    void addItem() {
      contacts.add(controller.text);
    }

    return MaterialApp(
        title: 'Contacts Example',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
          appBar: AppBar(
              title: const Text("Contacts"),
              backgroundColor: Colors.deepPurple),
          body: Padding(
              padding: const EdgeInsets.all(21),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      const Expanded(
                          flex: 2,
                          child: Text("Name: ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      Expanded(
                        flex: 8,
                        child: TextField(
                          controller: controller,
                          textAlign: TextAlign.center,
                          autofocus: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Jhon Doe',
                          ),
                        ),
                      )
                    ]),
                    Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 30),
                        child: MaterialButton(
                          child: Wrap(
                            children: const [
                            Icon(Icons.add),
                            Text("Add")
                          ]),
                          textColor: Colors.white,
                          padding: const EdgeInsets.only( bottom: 20, top: 20, left: 30, right: 30),
                          color: Colors.deepPurple,
                          onPressed: (){
                            setState(() {
                              addItem();
                            });
                          },
                        )),
                    Expanded(
                        child: ListView.builder(
                            itemCount: contacts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                      child: Text(
                                          contacts[index].substring(0, 1))),
                                  trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          deleteItem(index);
                                        });
                                      }),
                                  title: Text(contacts[index]),
                                ),
                              );
                            }))
                  ],
                ),
              )),
        ));
  }
}
