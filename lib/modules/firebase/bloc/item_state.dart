import 'package:equatable/equatable.dart';
import 'package:restalksflutterfirebase/modules/firebase/models/personModel.dart';
import 'package:meta/meta.dart';

abstract class ItemState extends Equatable {
  const ItemState();
}

class InitialItemState extends ItemState {
  @override
  List<Object> get props => [];
}

class ItemsLoaded extends ItemState {

  final List<PersonModel> persons;

  ItemsLoaded({@required this.persons});

  @override
  List<Object> get props => [persons];
}
