import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
}
