part of 'movie_tab_bloc.dart';

class MovieTabState extends Equatable {
  final int currentTabIndex;
  final List<MovieEntity>? movies;
  final NetworkStatus networkStatus;
  final AppErrorType? appErrorType;
  const MovieTabState({
    this.currentTabIndex = 0,
    this.movies,
    this.networkStatus = NetworkStatus.initial,
    this.appErrorType,
  });

  MovieTabState copyWith({int? currentTabIndex, List<MovieEntity>? movies, NetworkStatus? networkStatus, AppErrorType? appErrorType}) {
    return MovieTabState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      movies: movies ?? this.movies,
      networkStatus: networkStatus ?? this.networkStatus,
      appErrorType: appErrorType ?? this.appErrorType,
    );
  }

  @override
  List<Object?> get props => [currentTabIndex, movies, networkStatus, appErrorType];
}
