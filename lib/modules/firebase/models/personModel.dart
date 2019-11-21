import 'package:restalksflutterfirebase/modules/firebase/models/personEntity.dart';

class PersonModel {
  String documentID;
  String name;
  int age;

  PersonModel({this.documentID, this.name, this.age});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      age: json['age']
    );
  }

  toJson() {
    return {
      "name": name,
      "age": age,
    };
  }

  static PersonModel fromEntity(PersonEntity entity) {
    return PersonModel(
      documentID: entity.id,
      age: entity.age,
      name: entity.name,
    );
  }
}