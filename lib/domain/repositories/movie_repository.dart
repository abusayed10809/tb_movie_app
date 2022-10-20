import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/data/models/video_model.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/cast_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/entities/video_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<CastEntity>>> getMovieCastCrew(int id);
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovies(String searchTerm);

  /// local favourite
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);
  Future<Either<AppError, List<MovieEntity>>> getFavouriteMovies(NoParams noParams);
  Future<Either<AppError, void>> deleteFavouriteMovies(int movieId);
  Future<Either<AppError, bool>> checkIfMovieFavourite(int movieId);
}
