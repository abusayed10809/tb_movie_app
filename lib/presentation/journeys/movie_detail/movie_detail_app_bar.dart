import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/presentation/blocs/favourite/favourite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailAppBar({Key? key, required this.movieDetailEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
        BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            logMessage('favourite state -> ${state.isFavourite}');
            return GestureDetector(
              onTap: (){
                BlocProvider.of<FavouriteBloc>(context).add(ToggleFavouriteMovieEvent(isFavourite: state.isFavourite, movieEntity: MovieEntity.fromMovieDetailEntity(movieDetailEntity)));
              },
              child: Icon(
                state.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: 20.sp,
              ),
            );
          },
        ),
      ],
    );
  }
}
