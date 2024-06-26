import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/usercases/get_trending.dart';
import 'package:tb_movie_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  final LoadingBloc loadingBloc;
  MovieCarouselBloc({required this.loadingBloc, required this.getTrending, required this.movieBackdropBloc}) : super(const MovieCarouselState()) {
    on<MovieCarouselLoadEvent>(_onMovieCarouselLoadEvent);
  }

  Future<void> _onMovieCarouselLoadEvent(MovieCarouselLoadEvent event, Emitter<MovieCarouselState> emit) async {
    loadingBloc.add(StartLoadingEvent());
    final moviesEither = await getTrending(NoParams());
    moviesEither.fold((error) {
      emit(state.copyWith(networkStatus: NetworkStatus.failure, appErrorType: error.appErrorType));
    }, (movies) {
      movieBackdropBloc.add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
      emit(state.copyWith(networkStatus: NetworkStatus.success, defaultIndex: event.defaultIndex, movies: movies));
    });
    loadingBloc.add(FinishLoadingEvent());
  }
}
