import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

class MovieDataWidget extends StatelessWidget {
  const MovieDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
      builder: (context, state) {
        if(state.movie != null){
          return Text(
            state.movie!.title!,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.subtitle1,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
