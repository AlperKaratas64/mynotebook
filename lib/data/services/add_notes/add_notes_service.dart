import 'package:http/http.dart' as http;
import 'package:mynotebook/data/services/add_notes/model/add_notes_request_model.dart';
import 'package:mynotebook/data/services/add_notes/model/add_notes_response_model.dart';

abstract class AddNotesService {
  Future addNotes(AddNotesRequestModel addNotesRequestModel);
}

class AddNotesServiceImp extends AddNotesService {
  AddNotesServiceImp(find);

  @override
  Future addNotes(AddNotesRequestModel addNotesRequestModel) async {
    const String _baseUrl = 'http://tozlukitabım.com/notebook/add_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: addNotesRequestModel.toJson());

    if (response.statusCode == 200) {
      return addNotesResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}
