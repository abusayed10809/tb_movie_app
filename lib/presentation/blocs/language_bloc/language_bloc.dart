import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/languages.dart';
import 'package:tb_movie_app/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(Locale(Languages.languages[0].code))) {
    on<ToggleLanguageEvent>(_onToggleLanguageEvent);
  }

  _onToggleLanguageEvent(ToggleLanguageEvent event, Emitter<LanguageState> emit) {
    emit(
      state.copyWith(
        locale: Locale(event.languageEntity.code),
      ),
    );
  }
}
