import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/usercases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc({required this.getMovieDetail}) : super(const MovieDetailState()) {
    on<MovieDetailLoadEvent>(_onMovieDetailLoadEvent);
  }

  FutureOr<void> _onMovieDetailLoadEvent(MovieDetailLoadEvent event, Emitter<MovieDetailState> emit) async {
    final Either<AppError, MovieDetailEntity> eitherResponse = await getMovieDetail(
      MovieParams(event.movieId),
    );

    eitherResponse.fold(
      (l) => emit(
        state.copyWith(
          networkStatus: NetworkStatus.failure,
          movieDetailEntity: null,
        ),
      ),
      (r) => emit(
        state.copyWith(
          networkStatus: NetworkStatus.success,
          movieDetailEntity: r,
        ),
      ),
    );
  }
}
