part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Locale locale;
  final bool languageError;
  const LanguageState(this.locale, {this.languageError = false});

  LanguageState copyWith({Locale? locale, bool? languageError}) {
    return LanguageState(
      locale ?? this.locale,
      languageError: languageError ?? this.languageError,
    );
  }

  @override
  List<Object?> get props => [locale.languageCode, languageError];
}
