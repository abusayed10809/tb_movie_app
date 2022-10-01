import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';
import 'package:tb_movie_app/domain/entities/movie_detail_entity.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;
  const BigPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(),
      child: CachedNetworkImage(
        imageUrl: '${ApiConstants.baseImageUrl}/${movie.posterPath}',
        width: ScreenUtil().screenWidth,
      ),
    );
  }
}
