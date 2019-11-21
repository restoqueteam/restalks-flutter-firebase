import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {

  final String id;
  final int age;
  final String name;

  const PersonEntity(this.id, this.age, this.name);

  static PersonEntity fromSnapshot(DocumentSnapshot snap) {
    return PersonEntity(
      snap.documentID,
      snap.data['age'],
      snap.data['name'],
    );
  }

  @override
  List<Object> get props => [ id, age, name];
}