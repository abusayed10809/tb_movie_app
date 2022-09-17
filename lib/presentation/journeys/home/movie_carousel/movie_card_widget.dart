import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget{
  final int movieId;
  final String posterPath;
  const MovieCardWidget({super.key, required this.movieId, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 30,
      borderRadius: BorderRadius.circular(16.w),
      child: GestureDetector(
        onTap: (){

        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.baseImageUrl}/$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}