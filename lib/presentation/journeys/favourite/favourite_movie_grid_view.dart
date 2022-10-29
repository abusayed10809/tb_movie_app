import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/presentation/journeys/favourite/favourite_movie_card_widget.dart';

class FavouriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavouriteMovieGridView({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          return FavouriteMovieCardWidget(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
