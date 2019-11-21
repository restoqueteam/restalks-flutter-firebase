import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:restalksflutterfirebase/modules/firebase/repositories/firebaseRepository.dart';
import './bloc.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {

  final FirebaseRepository _firebaseRepository = FirebaseRepository();

  StreamSubscription _personSubscription;

  @override
  ItemState get initialState => InitialItemState();

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is ItemLoad) {
      _personSubscription?.cancel();
      _personSubscription = _firebaseRepository.persons().listen(
            (persons) => this.add(UpdateItems(persons: persons))
          );
    }
    if (event is UpdateItems) {
      yield ItemsLoaded(persons: event.persons);
      this.add(ItemLoad());
    }
    if (event is AddItem) {
      await _firebaseRepository.addPerson(event.item);
      this.add(ItemLoad());
    }
  }

  @override
  Future<void> close() async {
    _personSubscription?.cancel();
    return super.close();
  }
}
