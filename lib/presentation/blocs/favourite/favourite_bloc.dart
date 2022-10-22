import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/usercases/check_if_movie_favourite.dart';
import 'package:tb_movie_app/domain/usercases/delete_favourite_movie.dart';
import 'package:tb_movie_app/domain/usercases/get_favourite_movies.dart';
import 'package:tb_movie_app/domain/usercases/save_movie.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final SaveMovie saveMovie;
  final GetFavouriteMovies getFavouriteMovies;
  final DeleteFavouriteMovie deleteFavouriteMovie;
  final CheckIfMovieFavourite checkIfMovieFavourite;

  FavouriteBloc({
    required this.saveMovie,
    required this.getFavouriteMovies,
    required this.deleteFavouriteMovie,
    required this.checkIfMovieFavourite,
  }) : super(const FavouriteState()) {
    on<ToggleFavouriteMovieEvent>(_onToggleFavouriteMovieEvent);
    on<LoadFavouriteMovieEvent>(_onLoadFavouriteMovieEvent);
    on<DeleteFavouriteMovieEvent>(_onDeleteFavouriteMovieEvent);
    on<CheckIfMovieFavouriteEvent>(_onCheckIfMovieFavouriteEvent);
  }

  FutureOr<void> _onToggleFavouriteMovieEvent(ToggleFavouriteMovieEvent event, Emitter<FavouriteState> emit) async {
    if (event.isFavourite) {
      await deleteFavouriteMovie(MovieParams(event.movieEntity.id!));
    } else {
      await saveMovie(event.movieEntity);
    }
    final response = await checkIfMovieFavourite(MovieParams(event.movieEntity.id!));
    response.fold(
      (l) {
        emit(state.copyWith(networkStatus: NetworkStatus.failure, appErrorType: l.appErrorType));
      },
      (r) {
        emit(state.copyWith(
          networkStatus: NetworkStatus.success,
          isFavourite: r,
        ));
      },
    );
  }

  FutureOr<void> _onLoadFavouriteMovieEvent(LoadFavouriteMovieEvent event, Emitter<FavouriteState> emit) async {
    final Either<AppError, List<MovieEntity>> response = await getFavouriteMovies(NoParams());
    response.fold(
      (l) {
        emit(state.copyWith(networkStatus: NetworkStatus.failure, appErrorType: l.appErrorType));
      },
      (r) {
        emit(state.copyWith(networkStatus: NetworkStatus.success, movies: r));
      },
    );
  }

  FutureOr<void> _onDeleteFavouriteMovieEvent(DeleteFavouriteMovieEvent event, Emitter<FavouriteState> emit) async{
    await deleteFavouriteMovie(MovieParams(event.movieId));
    final Either<AppError, List<MovieEntity>> response = await getFavouriteMovies(NoParams());
    response.fold(
          (l) {
        emit(state.copyWith(networkStatus: NetworkStatus.failure, appErrorType: l.appErrorType));
      },
          (r) {
        emit(state.copyWith(networkStatus: NetworkStatus.success, movies: r));
      },
    );
  }

  FutureOr<void> _onCheckIfMovieFavouriteEvent(CheckIfMovieFavouriteEvent event, Emitter<FavouriteState> emit) async{
    final Either<AppError, bool> response = await checkIfMovieFavourite(MovieParams(event.movieId));
    response.fold(
          (l) {
        emit(state.copyWith(networkStatus: NetworkStatus.failure, appErrorType: l.appErrorType));
      },
          (r) {
        emit(state.copyWith(networkStatus: NetworkStatus.success, isFavourite: r,));
      },
    );
  }
}
