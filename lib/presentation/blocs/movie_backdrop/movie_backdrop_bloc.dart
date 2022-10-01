import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(const MovieBackdropState()) {
    on<MovieBackdropChangedEvent>(_onMovieBackdropChangedEvent);
  }

  _onMovieBackdropChangedEvent(MovieBackdropChangedEvent event, Emitter<MovieBackdropState> emit) {
    emit(state.copyWith(movie: event.movie));
  }
}
