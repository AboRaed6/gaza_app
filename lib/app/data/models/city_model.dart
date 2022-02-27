import 'package:cloud_firestore/cloud_firestore.dart';

class CityModel {
  String? docId;
  String? titleCity;
  String? descCity;
  String? imageCity;

  CityModel({this.docId, this.titleCity, this.descCity, this.imageCity});

  factory CityModel.fromMap(QuerySnapshot data) {
    Map<String, dynamic> json = data.docs as Map<String, dynamic>;
     return CityModel(
       docId: json['id'],
       titleCity: json['title'],
       descCity: json['desc'],
       imageCity: json['image'],
     );
    // docId = data.id;
    // titleCity = data['title'];
    // descCity = data['desc'];
    // imageCity = data['image'];
  }
}
