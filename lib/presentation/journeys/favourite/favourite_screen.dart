import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/dependencyinject/get_it.dart';
import 'package:tb_movie_app/presentation/blocs/favourite/favourite_bloc.dart';

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
    );
  }
}
