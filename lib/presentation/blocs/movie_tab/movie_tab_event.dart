part of 'movie_tab_bloc.dart';

abstract class MovieTabEvent extends Equatable {
  const MovieTabEvent();
}

class MovieTabChangedEvent extends MovieTabEvent{
  final int currentTabIndex;

  const MovieTabChangedEvent({this.currentTabIndex = 0});

  @override
  List<Object?> get props => [currentTabIndex];
}