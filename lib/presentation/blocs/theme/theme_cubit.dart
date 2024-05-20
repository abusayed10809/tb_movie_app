import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/theme_constants.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/usercases/get_preferred_theme.dart';
import 'package:tb_movie_app/domain/usercases/update_theme.dart';


class ThemeCubit extends Cubit<Themes> {
  final GetPreferredTheme getPreferredTheme;
  final UpdateTheme updateTheme;

  ThemeCubit({required this.getPreferredTheme, required this.updateTheme}) : super(Themes.dark);

  Future<void> toggleTheme() async{
    await updateTheme(state == Themes.dark ? ThemeConstants.lightTheme : ThemeConstants.darkTheme);
    loadPreferredTheme();
  }

  void loadPreferredTheme() async{
    final response = await getPreferredTheme(NoParams());
    emit(response.fold((l) => Themes.dark, (r) => r==ThemeConstants.darkTheme ? Themes.dark : Themes.light));
  }
}
