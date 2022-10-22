part of 'favourite_bloc.dart';

class FavouriteState extends Equatable {
  final List<MovieEntity> movies;
  final NetworkStatus networkStatus;
  final bool isFavourite;
  final AppErrorType? appErrorType;

  const FavouriteState({
    this.networkStatus = NetworkStatus.initial,
    this.movies = const <MovieEntity>[],
    this.isFavourite = false,
    this.appErrorType,
  });

  FavouriteState copyWith({NetworkStatus? networkStatus, List<MovieEntity>? movies, bool? isFavourite, AppErrorType? appErrorType,}) {
    return FavouriteState(
      networkStatus: networkStatus ?? this.networkStatus,
      movies: movies ?? this.movies,
      isFavourite: isFavourite ?? this.isFavourite,
      appErrorType: appErrorType ?? this.appErrorType,
    );
  }

  @override
  List<Object?> get props => [networkStatus, movies, isFavourite, appErrorType,];
}
