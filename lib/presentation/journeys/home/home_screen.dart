import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/dependencyinject/get_it.dart';
import 'package:tb_movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_tab/movie_tab_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_tab_widget.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabBloc movieTabBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(const MovieCarouselLoadEvent());

    movieTabBloc = getItInstance<MovieTabBloc>();

    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider(
          create: (context) => movieTabBloc,
        ),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (context, state) {
            switch (state.networkStatus) {
              case NetworkStatus.initial:
                return const SizedBox.shrink();

              case NetworkStatus.loading:
                return const SizedBox.shrink();

              case NetworkStatus.success:
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarouselWidget(
                        movies: state.movies,
                        defaultIndex: state.defaultIndex,
                      ),
                    ),
                    const FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: MovieTabWidget(),
                    ),
                  ],
                );

              case NetworkStatus.failure:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
