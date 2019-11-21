import 'package:restalksflutterfirebase/modules/firebase/models/personModel.dart';
import 'package:restalksflutterfirebase/modules/firebase/models/responseDefaultModel.dart';
import 'package:restalksflutterfirebase/modules/firebase/providers/firestoreInstanceProvider.dart';

class FirebaseSocialProvider {
  final FirestoreInstanceProvider _instance = new FirestoreInstanceProvider();

  Future<ResponseDefaultModel<List<PersonModel>>> getPersonsAsync() {
    ResponseDefaultModel<List<PersonModel>> result =
        new ResponseDefaultModel<List<PersonModel>>();

    result.data = new List<PersonModel>();

    return _instance.firestore
        .collection('persons')
        .getDocuments()
        .then((onValue) {
      onValue.documents.forEach((item) {
        var response = PersonModel.fromJson(item.data);
        response.documentID = item.documentID;
        result.data.add(response);
      });

      result.isSuccess = true;
      return result;
    }).catchError((onError) {
      result.isSuccess = false;
      result.error = onError;
      return result;
    });
  }

  ResponseDefaultModel newPerson(PersonModel model) {
    ResponseDefaultModel result = new ResponseDefaultModel();

    try {
      var document = _instance.firestore.collection('persons').document();

      document.setData(model.toJson());
      result.isSuccess = true;
    } catch (e) {
      result.error = e;
      result.isSuccess = false;
    }

    return result;
  }
}
