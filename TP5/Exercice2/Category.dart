import 'Computer.dart';

class Category {
  String name; // nom
  String description;
  List<Computer> computers = []; // (fr) Liste des ordis

  Category(this.name, this.description, this.computers);

  bool addComputer(Computer computer) {
    // ajouterOrdinateur
    for (Computer element in computers) {
      if (element.model == computer.model && element.name == computer.name)
        return false;
    }
    computers.add(computer);
    return true;
  }

  bool removeComputer(Computer computer) {
    // supprimerOrdinateur
    int index = computers.indexWhere((element) =>
        (element.model == computer.model && element.name == computer.name));
    if (index == -1) return false;
    computers.removeAt(index);
    return true;
  }

  List<Computer> searchByPrice(double maxPrice) {
    List<Computer> liste = [];
    computers.forEach((element) {
      if (element.price <= maxPrice) liste.add(element);
    });
    return liste;
  }

    
}
