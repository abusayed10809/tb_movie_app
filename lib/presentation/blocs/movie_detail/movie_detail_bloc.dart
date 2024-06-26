import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/usercases/get_movie_detail.dart';
import 'package:tb_movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/videos/videos_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideosBloc videosBloc;
  final FavouriteBloc favouriteBloc;
  final LoadingBloc loadingBloc;

  MovieDetailBloc({
    required this.castBloc,
    required this.getMovieDetail,
    required this.videosBloc,
    required this.favouriteBloc,
    required this.loadingBloc,
  }) : super(const MovieDetailState()) {
    on<MovieDetailLoadEvent>(_onMovieDetailLoadEvent);
  }

  FutureOr<void> _onMovieDetailLoadEvent(MovieDetailLoadEvent event, Emitter<MovieDetailState> emit) async {
    loadingBloc.add(StartLoadingEvent());

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

    favouriteBloc.add(CheckIfMovieFavouriteEvent(movieId: event.movieId));
    castBloc.add(LoadCastEvent(movieId: event.movieId));
    videosBloc.add(LoadVideosEvent(movieId: event.movieId));
    loadingBloc.add(FinishLoadingEvent());
  }
}
