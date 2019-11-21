import 'package:equatable/equatable.dart';
import 'package:restalksflutterfirebase/modules/firebase/models/personModel.dart';
import 'package:meta/meta.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class ItemLoad extends ItemEvent {
  @override
  List<Object> get props => null;

  @override
  String toString() => "ItemLoad";
}

class UpdateItems extends ItemEvent {

  final List<PersonModel> persons;

  UpdateItems({@required this.persons});

  @override
  List<Object> get props => [persons];

  @override
  String toString() => "UpdateItems";
}

class AddItem extends ItemEvent {

  final PersonModel item;

  AddItem({@required this.item});

  @override
  List<Object> get props => [item];

  @override
  String toString() => "AddItem";
}


