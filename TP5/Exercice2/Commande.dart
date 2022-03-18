import 'Client.dart';

class Commande {
  // Order

  String reference;

  Client client;

  String status;

  DateTime date;

  Commande(this.reference, this.client, this.status, this.date);

  @override
  String toString() {
    return '''{ 
      ref: "$reference",
      client: \t$client,
      status: "$status",
      date: "$date" 
    }''';
  }
}
