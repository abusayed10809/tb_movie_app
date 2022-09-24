part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Locale locale;
  const LanguageState(
    this.locale,
  );

  LanguageState copyWith({Locale? locale}) {
    return LanguageState(
      locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [locale.languageCode];
}
