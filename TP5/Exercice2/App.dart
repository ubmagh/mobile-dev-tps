import 'Category.dart';
import 'Client.dart';
import 'Commande.dart';
import 'Computer.dart';
import 'LigneCommande.dart';

void main(List<String> args) {
  // liste de 3 ordis
  List<Computer> computersList = [
    new Computer("Predator", "Acer", 14999.99, "Gamer laptop", 3),
    new Computer("Xps", "DELL", 17000, "Slim workStation", 2),
    new Computer("Omen", "HP", 13999.99, "Gamer laptop", 5)
  ];

  Category category =
      new Category("Vip laptops", "High level laptops", computersList);

  Client client = new Client("MAGHDAOUI", "Ayoub", "SomeWhere",
      "ubmagh@mail.com", "CasaBlanca", "06xxxxxxxxx", []);

  Commande commande = new Commande(
      "Order00001", client, "Processing...", new DateTime(2022, 10, 22));

  List<LigneCommande> listLigneCommande = [
    new LigneCommande(commande, computersList[0], 2),
    new LigneCommande(commande, computersList[1], 1),
    new LigneCommande(commande, computersList[2], 3)
  ];

  print("Commande/order details : ");
  print('''{ 
    order : {
      $commande
    },
    content: $listLigneCommande
    }''');
}
