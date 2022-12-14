import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/data/data_sources/movie_local_data_source.dart';
import 'package:tb_movie_app/data/data_sources/movie_remote_ds.dart';
import 'package:tb_movie_app/data/models/movie_model.dart';
import 'package:tb_movie_app/data/tables/movie_table.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/cast_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/entities/video_entity.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;
  MovieRepositoryImpl(this.movieRemoteDataSource, this.movieLocalDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await movieRemoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await movieRemoteDataSource.getComingSoon();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await movieRemoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await movieRemoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id) async {
    try {
      final movie = await movieRemoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<CastEntity>>> getMovieCastCrew(int id) async {
    try {
      final castCrew = await movieRemoteDataSource.getCastCrew(id);
      return Right(castCrew);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id) async{
    try{
      final videos = await movieRemoteDataSource.getVideos(id);
      return Right(videos);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovies(String searchTerm) async {
    try{
      final List<MovieEntity> movies = await movieRemoteDataSource.getSearchedMovies(searchTerm);
      return Right(movies);
    } on SocketException{
      return const Left(AppError(AppErrorType.network));
    } on Exception{
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfMovieFavourite(int movieId) async {
    try{
      final response = await movieLocalDataSource.checkIfMovieFavourite(movieId);
      return Right(response);
    } on Exception{
      return const Left(AppError(AppErrorType.localDb));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavouriteMovies(int movieId) async{
    try{
      final response = await movieLocalDataSource.deleteMovie(movieId);
      return Right(response);
    } on Exception{
      return const Left(AppError(AppErrorType.localDb));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFavouriteMovies(NoParams noParams) async{
    try{
      final response = await movieLocalDataSource.getMovies();
      return Right(response);
    } on Exception{
      return const Left(AppError(AppErrorType.localDb));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async{
    try{
      final response = await movieLocalDataSource.saveMovie(MovieTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception{
      return const Left(AppError(AppErrorType.localDb));
    }
  }
}
