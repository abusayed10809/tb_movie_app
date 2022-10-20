import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_search_params.dart';
import 'package:tb_movie_app/domain/usercases/search_movies.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({required this.searchMovies}) : super(const SearchMovieState()) {
    on<SearchTermChangedEvent>(_onSearchTermChangedEvent);
  }

  _onSearchTermChangedEvent(SearchTermChangedEvent event, Emitter<SearchMovieState> emit) async {
    if (event.searchTerm.length > 2) {
      emit(state.copyWith(networkStatus: NetworkStatus.loading, movies: <MovieEntity>[]));
      final Either<AppError, List<MovieEntity>> response = await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));
      response.fold(
        (l) {
          emit(state.copyWith(networkStatus: NetworkStatus.failure, movies: <MovieEntity>[], appErrorType: l.appErrorType));
        },
        (r) {
          emit(state.copyWith(networkStatus: NetworkStatus.success, movies: r));
        },
      );
    }
  }
}
