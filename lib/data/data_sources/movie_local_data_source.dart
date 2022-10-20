import 'package:hive/hive.dart';
import 'package:tb_movie_app/common/constants/hive_constants.dart';
import 'package:tb_movie_app/data/tables/movie_table.dart';

abstract class MovieLocalDataSource{
  Future<void> saveMovie(MovieTable movieTable);
  Future<List<MovieTable>> getMovies();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkIfMovieFavourite(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource{
  @override
  Future<bool> checkIfMovieFavourite(int movieId) async {
    final movieBox = await Hive.openBox(HiveConstants.movieBox);
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox(HiveConstants.movieBox);
    await movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getMovies() async {
    final movieBox = await Hive.openBox(HiveConstants.movieBox);
    final movieIds = movieBox.keys;
    List<MovieTable> movies = [];
    for (var singleMovieId in movieIds) {
      movies.add(movieBox.get(singleMovieId));
    }
    return movies;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox(HiveConstants.movieBox);
    await movieBox.put(movieTable.id, movieTable);
  }

}