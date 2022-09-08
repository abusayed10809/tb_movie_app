import 'dart:convert';

import 'package:http/http.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';
import 'package:tb_movie_app/data/models/movie_model.dart';
import 'package:tb_movie_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource{
  Future<List<MovieModel>?> getTrending();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  final Client _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>?> getTrending() async{
    Uri uri = Uri.parse(ApiConstants.trendingUrl);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response = await _client.get(uri,headers: headers);
    if(response.statusCode==200 || response.statusCode==201){
      final responseBody = jsonDecode(utf8.decode(response.bodyBytes));
      final movies = MovieResultModel.fromJson(responseBody);
      return movies.movies;
    } else{
      throw Exception(response.reasonPhrase);
    }
  }
}