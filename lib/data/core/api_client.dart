import 'dart:convert';

import 'package:http/http.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    try {
      String pathWithParams = getPath(path, params);
      Uri uri = Uri.parse(pathWithParams);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      logMessage('uri: ${uri}');

      final response = await _client.get(uri, headers: headers);

      logMessage('response -> ${response.body}');
      logMessage('status code -> ${response.statusCode}');
      await Future.delayed(const Duration(milliseconds: 2000));
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

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if(params?.isNotEmpty ?? false){
      params!.forEach((key, value) {
        paramsString += "&$key=$value";
      });
    }
    return path+paramsString;
  }
}
