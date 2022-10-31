import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/movie_detail_screen.dart';

class FavouriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavouriteMovieCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieDetailArguments: MovieDetailArguments(movie.id!),
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.baseImageUrl}/${movie.posterPath}',
                fit: BoxFit.cover,
                width: 100.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<FavouriteBloc>(context).add(DeleteFavouriteMovieEvent(movieId: movie.id!));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Icon(
                      Icons.delete,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
