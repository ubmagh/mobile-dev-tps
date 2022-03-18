import 'Commande.dart';
import 'Computer.dart';

class LigneCommande {
  int qte;
  Computer computer;
  Commande commande;

  LigneCommande(this.commande, this.computer, this.qte);

  @override
  String toString() {
    return '''{
      qte: $qte,
      computer: {
        model: ${computer.model},
        name: ${computer.name},
        price: ${computer.price}
      }
    }''';
  }
}
