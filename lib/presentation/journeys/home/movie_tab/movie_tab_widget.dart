import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/presentation/blocs/movie_tab/movie_tab_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_list_view.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_tab_constants.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_tab_title_widget.dart';

class MovieTabWidget extends StatefulWidget {
  const MovieTabWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabWidget> createState() => _MovieTabWidgetState();
}

class _MovieTabWidgetState extends State<MovieTabWidget> with SingleTickerProviderStateMixin {

  MovieTabBloc get movieTabBloc => BlocProvider.of<MovieTabBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabBloc, MovieTabState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for(var i = 0; i<MovieTabConstants.movieTabs.length; i++)
                    MovieTabTitleWidget(
                      title: MovieTabConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabConstants.movieTabs[i].index == state.currentTabIndex,
                    ),
                ],
              ),
              if(state.movies!=null)
                Expanded(
                  child: MovieListView(
                    movies: state.movies!,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index){
    movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
