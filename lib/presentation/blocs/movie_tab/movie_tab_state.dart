part of 'movie_tab_bloc.dart';

class MovieTabState extends Equatable {
  final int currentTabIndex;
  final List<MovieEntity>? movies;
  const MovieTabState({
    this.currentTabIndex = 0,
    this.movies
  });

  MovieTabState copyWith({int? currentTabIndex, List<MovieEntity>? movies}){
    return MovieTabState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      movies: movies ?? this.movies
    );
  }

  @override
  List<Object?> get props => [currentTabIndex, movies];
}
