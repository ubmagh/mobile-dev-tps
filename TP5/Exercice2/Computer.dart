class Computer { // ordinateur :/
  String name;
  String model; //marque
  double price; // prix
  String description;
  int stockQte;

  Computer( this.name, this.model, this.price, this.description, this.stockQte);

  double priceForQte(int qte) {
    return qte * price;
  }
  
  
}
