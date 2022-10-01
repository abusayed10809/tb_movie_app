import 'dart:convert';

import 'package:http/http.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    try {
      Uri uri = Uri.parse(path);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      final response = await _client.get(uri, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

        return responseBody;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (error) {
      throw Exception("api connection failed");
    }
  }
}
