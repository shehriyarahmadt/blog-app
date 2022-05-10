import 'dart:convert';
import 'package:blog_app/model/dictionary_model.dart';
import 'package:http/http.dart' as http;

class ApiCallRepo {
  /// https://owlbot.info/api/v4/dictionary/owl
  ///
  ///
  static Future<Dictionary?> dictionaryApi(String? name) async {
    try {
      var headers = {
        'Authorization': 'Token 67cf7719a34b1a7df1a4c72ab5e0c29748977b1d',
        'Cookie':
        'csrftoken=WKDJFHI1Ymxp5sxVtrcqxhswRXOraiLGCoOlWiVs6tRtVmnIQhNGWIyyLxWxRBlp'
      };
      final response = await http.get(
          Uri.parse('https://owlbot.info/api/v4/dictionary/$name'),
          headers: headers);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
            print('dic Response body: $body');

        return dictionaryFromMap(response.body);
      } else {
        print('response statusCode ${response.statusCode}');
        return null;
      }
    } on Exception catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}
