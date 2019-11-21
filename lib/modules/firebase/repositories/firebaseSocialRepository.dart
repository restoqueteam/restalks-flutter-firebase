
import 'package:restalksflutterfirebase/modules/firebase/models/personModel.dart';
import 'package:restalksflutterfirebase/modules/firebase/models/responseDefaultModel.dart';
import 'package:restalksflutterfirebase/modules/firebase/providers/firebaseSocialProvider.dart';

class FirebaseSocialRepository {
  final FirebaseSocialProvider _provider = new FirebaseSocialProvider();

  Future<ResponseDefaultModel<List<PersonModel>>> getPersonsAsync() async {
    return await _provider.getPersonsAsync();
  }

  ResponseDefaultModel newPerson(PersonModel model) {
    return _provider.newPerson(model);
  }
}
