import 'package:tb_movie_app/data/core/api_client.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';
import 'package:tb_movie_app/data/models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String> createSession(Map<String, dynamic> requestBody);
  Future<bool> deleteSession(String sessionId);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<RequestTokenModel> getRequestToken() async {
    try{
      final response = await _client.get(ApiConstants.getRequestTokenUrl);
      final requestTokenModel = RequestTokenModel.fromJson(response);
      return requestTokenModel;
    } catch (error) {
      throw Exception("model conversion failed");
    }
  }

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    try{
      final response = await _client.post(
        ApiConstants.validateRequestTokenUrl,
        params: requestBody,
      );
      return RequestTokenModel.fromJson(response);
    } catch (error) {
      throw Exception("model conversion failed");
    }
  }

  @override
  Future<String> createSession(Map<String, dynamic> requestBody) async {
    try{
      final response = await _client.post(
        ApiConstants.createNewSessionUrl,
        params: requestBody,
      );
      return response['success'] ? response['session_id'] : null;
    } catch (error) {
      throw Exception("model conversion failed");
    }
  }

  @override
  Future<bool> deleteSession(String sessionId) async {
    try{
      final response = await _client.deleteWithBody(
        ApiConstants.deleteSessionUrl,
        params: {
          'session_id': sessionId,
        },
      );
      return response['success'] ?? false;
    } catch (error) {
      throw Exception("model conversion failed");
    }
  }
}