part of 'favourite_bloc.dart';

class FavouriteState extends Equatable {
  final List<MovieEntity> movies;
  final NetworkStatus networkStatus;
  final bool isFavourite;

  const FavouriteState({
    this.networkStatus = NetworkStatus.initial,
    this.movies = const <MovieEntity>[],
    this.isFavourite = false,
  });

  FavouriteState copyWith({NetworkStatus? networkStatus, List<MovieEntity>? movies, bool? isFavourite}) {
    return FavouriteState(
      networkStatus: networkStatus ?? this.networkStatus,
      movies: movies ?? this.movies,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object?> get props => [networkStatus, movies, isFavourite];
}
