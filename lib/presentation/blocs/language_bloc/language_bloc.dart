import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/languages.dart';
import 'package:tb_movie_app/domain/entities/language_entity.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/usercases/get_preferred_language.dart';
import 'package:tb_movie_app/domain/usercases/update_language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({required this.getPreferredLanguage, required this.updateLanguage}) : super(LanguageState(Locale(Languages.languages[0].code))) {
    on<ToggleLanguageEvent>(_onToggleLanguageEvent);
    on<LoadPreferredLanguageEvent>(_onLoadPreferredLanguageEvent);
  }

  _onToggleLanguageEvent(ToggleLanguageEvent event, Emitter<LanguageState> emit) async {
    await updateLanguage(event.languageEntity.code);
    add(LoadPreferredLanguageEvent());
    emit(state.copyWith(
      locale: Locale(event.languageEntity.code),
    ));
  }

  FutureOr<void> _onLoadPreferredLanguageEvent(LoadPreferredLanguageEvent event, Emitter<LanguageState> emit) async {
    final response = await getPreferredLanguage(NoParams());
    response.fold(
      (l) {
        emit(state.copyWith(
          languageError: true,
        ));
      },
      (r) {
        emit(state.copyWith(
          locale: Locale(r),
        ));
      },
    );
  }
}
