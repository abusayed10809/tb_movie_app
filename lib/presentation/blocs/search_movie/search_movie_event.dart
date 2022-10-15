part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();
}

class SearchTermChangedEvent extends SearchMovieEvent{
  final String searchTerm;

  const SearchTermChangedEvent(this.searchTerm);

  @override
  List<Object?> get props => [searchTerm];
}