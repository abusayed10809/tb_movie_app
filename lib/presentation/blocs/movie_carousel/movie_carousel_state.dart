part of 'movie_carousel_bloc.dart';

class MovieCarouselState extends Equatable {
  final NetworkStatus networkStatus;
  final int defaultIndex;
  final List<MovieEntity> movies;
  final String errorMsg;

  const MovieCarouselState({
    this.networkStatus = NetworkStatus.initial,
    this.defaultIndex = 0,
    this.movies = const <MovieEntity>[],
    this.errorMsg = '',
  });

  MovieCarouselState copyWith({NetworkStatus? networkStatus, int? defaultIndex, List<MovieEntity>? movies, String? errorMsg}){
    return MovieCarouselState(
      networkStatus: networkStatus ?? this.networkStatus,
      defaultIndex: defaultIndex ?? this.defaultIndex,
      movies: movies ?? this.movies,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [networkStatus, defaultIndex, movies, errorMsg];
}