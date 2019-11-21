import 'package:restalksflutterfirebase/modules/firebase/models/personEntity.dart';
import 'package:restalksflutterfirebase/modules/firebase/models/personModel.dart';
import 'package:restalksflutterfirebase/modules/firebase/providers/firestoreInstanceProvider.dart';

class FirebaseProvider {
  final FirestoreInstanceProvider _instance = new FirestoreInstanceProvider();

  Stream<List<PersonModel>> getPersons() {

    var personCollection = _instance.firestore.collection('persons');

    return personCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => PersonModel.fromEntity(PersonEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  Future<bool> addPerson(PersonModel model) async {
    try {
      var document = _instance.firestore.collection('persons').document();
      document.setData(model.toJson());
      return Future.value(true);
    }
    catch(error) {
      return Future.value(false);
    }
  }
}
