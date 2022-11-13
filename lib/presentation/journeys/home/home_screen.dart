import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/size_config.dart';
import 'package:tb_movie_app/dependencyinject/get_it.dart';
import 'package:tb_movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_tab/movie_tab_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_tab_widget.dart';
import 'package:tb_movie_app/presentation/widget/app_error_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabBloc movieTabBloc;
  late SearchMovieBloc searchMovieBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(const MovieCarouselLoadEvent());
    movieTabBloc = getItInstance<MovieTabBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    searchMovieBloc = getItInstance<SearchMovieBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabBloc.close();
    searchMovieBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    final fontSize = mq.textScaleFactor;
    final appbarHeight = AppBar().preferredSize.height;
    final safeAreaPadding = mq.padding.top;
    SizeConfig().init(
      widthI: width,
      heightI: height,
      fontSizeI: fontSize,
      appbarHeightI: appbarHeight,
      safeAreaPaddingI: safeAreaPadding,
    );

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
        BlocProvider(
          create: (context) => searchMovieBloc,
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
                return AppErrorWidget(
                  onPressed: () {
                    movieCarouselBloc.add(const MovieCarouselLoadEvent());
                  },
                  appErrorType: state.appErrorType!,
                );
            }
          },
        ),
      ),
    );
  }
}
