import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tb_movie_app/common/extensions/num_extensions.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/movie_detail_screen.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;
  const SearchMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movie.id!),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.025.width(),
          vertical: 0.025.height(),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(
                0.01.width(),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  0.05.width(),
                ),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.baseImageUrl}/${movie.posterPath}',
                  width: 0.25.width(),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title!,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movie.overview!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
