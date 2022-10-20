part of 'search_movie_bloc.dart';

class SearchMovieState extends Equatable {
  final List<MovieEntity> movies;
  final NetworkStatus networkStatus;
  final AppErrorType? appErrorType;

  const SearchMovieState({
    this.networkStatus = NetworkStatus.initial,
    this.movies = const <MovieEntity>[],
    this.appErrorType,
  });

  SearchMovieState copyWith({NetworkStatus? networkStatus, List<MovieEntity>? movies, AppErrorType? appErrorType}){
    return SearchMovieState(
      networkStatus: networkStatus ?? this.networkStatus,
      movies: movies ?? this.movies,
      appErrorType: appErrorType ?? this.appErrorType,
    );
  }

  @override
  List<Object?> get props => [networkStatus, movies, appErrorType];
}