import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/dependencyinject/get_it.dart';
import 'package:tb_movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/favourite/favourite_movie_grid_view.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late FavouriteBloc _favouriteBloc;

  @override
  void initState() {
    super.initState();
    _favouriteBloc = getItInstance<FavouriteBloc>();
    _favouriteBloc.add(LoadFavouriteMovieEvent());
  }

  @override
  void dispose() {
    _favouriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.favouriteMovies.langTranslate(context),
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider.value(
        value: _favouriteBloc,
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            switch(state.networkStatus){
              case NetworkStatus.initial:
                return loadingData();
              case NetworkStatus.loading:
                return loadingData();
              case NetworkStatus.success:
                if(state.movies.isEmpty){
                  return emptyData(message: TranslationConstants.noFavoriteMovie.langTranslate(context));
                }
                return FavouriteMovieGridView(
                  movies: state.movies,
                );
              case NetworkStatus.failure:
                return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
