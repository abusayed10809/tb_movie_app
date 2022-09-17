part of 'movie_backdrop_bloc.dart';

class MovieBackdropState extends Equatable {
  final MovieEntity? movie;

  const MovieBackdropState({
    this.movie
  });

  MovieBackdropState copyWith({MovieEntity? movie}){
    return MovieBackdropState(
      movie: movie ?? this.movie,
    );
  }

  @override
  List<Object?> get props => [movie];
}
