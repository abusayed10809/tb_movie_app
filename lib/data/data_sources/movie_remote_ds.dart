import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/data/core/api_client.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';
import 'package:tb_movie_app/data/models/movie_detail_model.dart';
import 'package:tb_movie_app/data/models/movie_model.dart';
import 'package:tb_movie_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final decodedResponse = await _client.get(ApiConstants.trendingUrl);
      final movies = MovieResultModel.fromJson(decodedResponse).movies;
      if (movies != null) {
        return movies;
      } else {
        throw Exception("movie field null");
      }
    } catch (error) {
      throw Exception("model conversion failed");
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    try {
      final decodedResponse = await _client.get(ApiConstants.popularUrl);
      final movies = MovieResultModel.fromJson(decodedResponse).movies;
      if (movies != null) {
        return movies;
      } else {
        throw Exception("movie field null");
      }
    } catch (error) {
      throw Exception("model conversion failed");
    }
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    try {
      final decodedResponse = await _client.get(ApiConstants.comingSoonUrl);
      final movies = MovieResultModel.fromJson(decodedResponse).movies;
      if (movies != null) {
        return movies;
      } else {
        throw Exception("movie field null");
      }
    } catch (error) {
      throw Exception("model conversion failed");
    }
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    try {
      final decodedResponse = await _client.get(ApiConstants.playingNowUrl);
      final movies = MovieResultModel.fromJson(decodedResponse).movies;
      if (movies != null) {
        return movies;
      } else {
        throw Exception("movie field null");
      }
    } catch (error) {
      throw Exception("model conversion failed");
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    try {
      final response = await _client.get('${ApiConstants.movieDetails}$id?api_key=${ApiConstants.apiKey}');

      final movie = MovieDetailModel.fromJson(response);

      return movie;
    } catch (error) {
      throw Exception('model conversion failed');
    }
  }
}
