import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/common/helper_functions.dart';
import 'package:tb_movie_app/data/data_sources/movie_remote_ds.dart';
import 'package:tb_movie_app/data/models/movie_model.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl(this.movieRemoteDataSource);
  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await movieRemoteDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong!'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async{
    try {
      final movies = await movieRemoteDataSource.getComingSoon();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong!'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async{
    try {
      final movies = await movieRemoteDataSource.getPlayingNow();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong!'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async{
    try {
      final movies = await movieRemoteDataSource.getPopular();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong!'));
    }
  }
}
