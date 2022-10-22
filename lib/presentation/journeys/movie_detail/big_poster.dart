import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/extensions/num_extensions.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';
import 'package:tb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/movie_detail_app_bar.dart';
import 'package:tb_movie_app/presentation/theme/app_text.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;
  const BigPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.baseImageUrl}/${movie.posterPath}',
            width: ScreenUtil().screenWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title!,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              movie.releaseDate!,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movie.voteAverage!.convertToPercentageString(),
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          left: 15.w,
          right: 15.w,
          top: ScreenUtil().statusBarHeight + 4.h,
          child: MovieDetailAppBar(
            movieDetailEntity: movie,
          ),
        ),
      ],
    );
  }
}
