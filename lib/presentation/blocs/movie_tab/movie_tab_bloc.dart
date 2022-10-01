import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/usercases/get_coming_soon.dart';
import 'package:tb_movie_app/domain/usercases/get_playing_now.dart';
import 'package:tb_movie_app/domain/usercases/get_popular.dart';

part 'movie_tab_event.dart';
part 'movie_tab_state.dart';

class MovieTabBloc extends Bloc<MovieTabEvent, MovieTabState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;
  MovieTabBloc({required this.getPopular, required this.getPlayingNow, required this.getComingSoon}) : super(const MovieTabState()) {
    on<MovieTabChangedEvent>(_onMovieTabChangedEvent);
  }

  _onMovieTabChangedEvent(MovieTabChangedEvent event, Emitter<MovieTabState> emit) async {
    Either<AppError, List<MovieEntity>>? moviesEither;
    switch (event.currentTabIndex) {
      case 0:
        moviesEither = await getPopular(NoParams());
        break;
      case 1:
        moviesEither = await getPlayingNow(NoParams());
        break;
      case 2:
        moviesEither = await getComingSoon(NoParams());
        break;
    }

    moviesEither?.fold(
      (errorMsg) => emit(
        state.copyWith(
          currentTabIndex: event.currentTabIndex,
          networkStatus: NetworkStatus.failure,
          movies: null,
          appErrorType: errorMsg.appErrorType,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          currentTabIndex: event.currentTabIndex,
          networkStatus: NetworkStatus.success,
          movies: movies,
          appErrorType: null,
        ),
      ),
    );
  }
}
