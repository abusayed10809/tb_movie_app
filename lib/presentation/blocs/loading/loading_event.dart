part of 'loading_bloc.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();
}

class StartLoadingEvent extends LoadingEvent {
  @override
  List<Object?> get props => [];
}

class FinishLoadingEvent extends LoadingEvent{
  @override
  List<Object?> get props => [];
}