part of 'movie_carousel_bloc.dart';

class MovieCarouselState extends Equatable {
  final NetworkStatus networkStatus;
  final int defaultIndex;
  final List<MovieEntity> movies;
  final AppErrorType? appErrorType;

  const MovieCarouselState({
    this.networkStatus = NetworkStatus.initial,
    this.defaultIndex = 0,
    this.movies = const <MovieEntity>[],
    this.appErrorType,
  });

  MovieCarouselState copyWith({
    NetworkStatus? networkStatus,
    int? defaultIndex,
    List<MovieEntity>? movies,
    AppErrorType? appErrorType,
  }) {
    return MovieCarouselState(
      networkStatus: networkStatus ?? this.networkStatus,
      defaultIndex: defaultIndex ?? this.defaultIndex,
      movies: movies ?? this.movies,
      appErrorType: appErrorType ?? this.appErrorType,
    );
  }

  @override
  List<Object?> get props => [
        networkStatus,
        defaultIndex,
        movies,
        appErrorType,
      ];
}
