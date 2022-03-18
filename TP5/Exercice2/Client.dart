import 'Commande.dart';

class Client {
  String nom, // last name
      prenom, // first name
      adresse, // address
      email,
      ville, // city
      telephone; // phone
  List<Commande> commandes; // orders

  Client(this.nom, this.prenom, this.adresse, this.email, this.ville,
      this.telephone, this.commandes);

  bool ajouterCommande(Commande commande) {
    for (Commande cmd in commandes) {
      if (commande.reference == cmd.reference) return false;
    }
    commandes.add(commande);
    return true;
  }

  bool supprimerCommande(Commande commande) {
    int index = commandes
        .indexWhere((element) => (commande.reference == element.reference));
    if (index == -1) return false;
    commandes.removeAt(index);
    return true;
  }

  @override
  String toString() {
    return '''{ 
      fname: "$prenom", 
      lname: "$nom", 
      address: "$adresse", 
      email: "$email", 
      city: "$ville", 
      phone: "$telephone" 
    }''';
  }
}
