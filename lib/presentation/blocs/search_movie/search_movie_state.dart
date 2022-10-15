part of 'search_movie_bloc.dart';

class SearchMovieState extends Equatable {
  final List<MovieEntity> movies;
  final NetworkStatus networkStatus;

  const SearchMovieState({
    this.networkStatus = NetworkStatus.initial,
    this.movies = const <MovieEntity>[],
  });

  SearchMovieState copyWith({NetworkStatus? networkStatus, List<MovieEntity>? movies}){
    return SearchMovieState(
      networkStatus: networkStatus ?? this.networkStatus,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object?> get props => [networkStatus, movies];
}