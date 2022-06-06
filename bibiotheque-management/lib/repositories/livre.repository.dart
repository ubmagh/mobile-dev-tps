


import 'package:bibiotheque_management/models/livre.model.dart';

class LivreRepository {

  List<Livre> livres = [

    Livre(  id_livre: 1, anne_publication: DateTime.now(), auteur: "Auteur 1", isbn: "ISBN1", nb_exemplaires: 2, prix: 120.99, titre: "Livre 1"),
    Livre(  id_livre: 2, anne_publication: DateTime.now(), auteur: "Auteur 2", isbn: "ISBN2", nb_exemplaires: 5, prix: 220.99, titre: "Livre 2"),
    Livre(  id_livre: 3, anne_publication: DateTime.now(), auteur: "Auteur 3", isbn: "ISBN3", nb_exemplaires: 2, prix: 450.99, titre: "Livre 3"),
    Livre(  id_livre: 4, anne_publication: DateTime.now(), auteur: "Auteur 1", isbn: "ISBN4", nb_exemplaires: 1, prix: 50.99, titre: "Livre 4"),
    Livre(  id_livre: 5, anne_publication: DateTime.now(), auteur: "Auteur 2", isbn: "ISBN5", nb_exemplaires: 6, prix: 29.6, titre: "Livre 5"),
    Livre(  id_livre: 6, anne_publication: DateTime.now(), auteur: "Auteur 2", isbn: "ISBN6", nb_exemplaires: 1, prix: 130.99, titre: "Livre 6"),

  ];

  Future<List<Livre>> allLivres() async {
    var future = await Future.delayed(const Duration(seconds: 2));
    return livres;
  }

  Future<List<Livre>> findLivres( String keyword) async {
    var future = await Future.delayed(const Duration(seconds: 2));
    List<Livre> result = livres.where((element){
       return element.titre.contains(keyword);
    }).toList();
    return livres;
  }

  Future<bool> deleteLivre( int livre_id) async{
    var future = await Future.delayed(const Duration(seconds: 2));
    livres.removeWhere((element) => element.id_livre==livre_id);
    return true;
  }


}