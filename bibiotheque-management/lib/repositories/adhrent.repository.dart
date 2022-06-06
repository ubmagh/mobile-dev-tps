import 'dart:math';
import 'package:bibiotheque_management/models/adherent.model.dart';



class AdherentRepository {

  List<Adherent> adherents = [

    Adherent(id_adherent: 1, nom: "maghdaoui", prenom: "ayoub", email: "ayoub@maghdaoui.com", tel: "012345677"),
    Adherent(id_adherent: 2, nom: "Habbaz", prenom: "Souf", email: "souf@me.com", tel: "012345671"),
    Adherent(id_adherent: 3, nom: "aqqa", prenom: "omar", email: "omar@me.com", tel: "012345672"),
    Adherent(id_adherent: 4, nom: "idris", prenom: "ilham", email: "ilham@me.com", tel: "012345673"),
    Adherent(id_adherent: 5, nom: "yousefi", prenom: "mohamed", email: "mohamed@me.com", tel: "012345674"),
    Adherent(id_adherent: 6, nom: "Ibrahim", prenom: "mohamed", email: "ibrahim@me.com", tel: "012345675"),
    Adherent(id_adherent: 7, nom: "ali", prenom: "mohamed", email: "ali@me.com", tel: "012345676"),

  ];

  Future<List<Adherent>> allAdherents() async {
    var future = await Future.delayed(const Duration(seconds: 2));
    int rand = Random().nextInt(10);
    if( rand>9) {
      throw Exception(" C'est un erreur de type X 👍!");
    }
    return adherents;
  }


  Future<bool> deleteAdherent( int adherent_id) async{
    var future = await Future.delayed(const Duration(seconds: 2));
    int rand = Random().nextInt(10);
    if( rand>9) {
      throw Exception(" C'est un erreur dans la suppression de type X 👍!");
    }
    adherents.removeWhere((element) => element.id_adherent==adherent_id);
    return true;
  }


}