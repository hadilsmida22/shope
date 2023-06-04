import 'package:ecommerce_int2/model_api/acheter.dart';
import 'package:ecommerce_int2/model_api/produits.dart';
import 'package:ecommerce_int2/model_api/user.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();
String dateCreation = DateFormat('yyyy-MM-dd').format(now);
class Listes {
  int? idListe;
  String? dateCreation;
  String? etat;
  int? total;
  User? inter_;

  List<Acheters>? achats;
  List<Produits>? produits;

  Listes(
    {this.idListe ,
    this.dateCreation,
    this.etat,
    this.total,
    this.inter_,
    this.achats,
    this.produits,
    });

   Listes.fromJson(Map<String, dynamic> json) {
    idListe = json['idListe'];
    dateCreation = json['dateCreation'];
    etat = json['etat'];
    total = json['total'];
    if (json['achats'] != null) {
      achats = <Acheters>[];
      json['achats'].forEach((v) {
        achats!.add(new Acheters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['idListe'] = this.idListe;
  data['dateCreation'] = this.dateCreation;
  data['etat'] = this.etat;
  data['total'] = this.total;
  if (this.achats != null) {
    data['achats'] = this.achats!.map((v) => v.toJson()).toList();
  }
  return data;
  }

}