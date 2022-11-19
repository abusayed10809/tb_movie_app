import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<StartLoadingEvent>(_onStartLoadingEvent);
    on<FinishLoadingEvent>(_onFinishLoadingEvent);
  }

  FutureOr<void> _onStartLoadingEvent(StartLoadingEvent event, Emitter<LoadingState> emit) async{
    emit(LoadingStarted());
  }

  FutureOr<void> _onFinishLoadingEvent(FinishLoadingEvent event, Emitter<LoadingState> emit) async{
    emit(LoadingFinished());
  }
}
