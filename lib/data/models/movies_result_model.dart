
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/data/models/movie_model.dart';

class MovieResultModel {
  int? page;
  List<MovieModel>? movies;
  int? totalPages;
  int? totalResults;

  MovieResultModel(
      {this.page, required this.movies, this.totalPages, this.totalResults});

  MovieResultModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {
        movies!.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (movies != null) {
      data['results'] = movies!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}





