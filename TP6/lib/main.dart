import 'package:flutter/material.dart';
import 'package:products_management_app/entities/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        secondaryHeaderColor: Colors.deepOrange,
        backgroundColor: Colors.white70,
        cardColor: Colors.lightBlue,
        buttonColor: Colors.orange
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    void deleteItem(int index) {
      products.removeAt(index);
    }

    void addItem() {
      Product p = Product("Product000" + products.length.toString(),
          nameController.text, double.parse(priceController.text));
      products.add(p);
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Title(
                  child: const Text("Products"), color: Colors.deepOrange)),
        ),
        body: Padding(
            padding: const EdgeInsets.all(21),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    const Expanded(
                        flex: 2,
                        child: Text("Product name: ",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                    Expanded(
                      flex: 8,
                      child: TextField(
                        controller: nameController,
                        textAlign: TextAlign.center,
                        autofocus: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'PlayStation 6',
                        ),
                      ),
                    )
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 6),
                    child: Row(children: [
                      const Expanded(
                          flex: 2,
                          child: Text("Price: ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      Expanded(
                        flex: 8,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: priceController,
                          textAlign: TextAlign.center,
                          autofocus: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '0.00',
                          ),
                        ),
                      )
                    ]),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 24),
                      child: MaterialButton(
                        child: Wrap(
                            children: const [Icon(Icons.add), Text("Add")]),
                        textColor: Colors.white,
                        padding: const EdgeInsets.only(
                            bottom: 16, top: 16, left: 35, right: 35),
                        color: Colors.deepPurple,
                        onPressed: () {
                          setState(() {
                            addItem();
                          });
                        },
                      )),
                  const Text("Products list : "),
                  Expanded(
                      child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.deepOrange,
                                    child: Text(
                                        products[index].name.substring(0, 1))),
                                trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        deleteItem(index);
                                      });
                                    }),
                                title: Text(products[index].name),
                                subtitle: Text("price : "+products[index].price.toString()),

                              ),
                            );
                          }))
                ],
              ),
            )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
