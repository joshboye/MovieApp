import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_bottom_tabs/movie_bottom_tabs_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';
import 'package:movieapp/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_bottom_tabs/movie_bottom_tabs_lists_widget.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousal/movie_carousal_widget.dart';
import 'package:movieapp/presentation/journeys/drawer/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarousalBloc movieCarousalBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieBottomTabsBloc movieBottomTabsBloc;
  late SearchMovieBloc searchMovieBloc;
  @override
  void initState() {
    super.initState();
    movieCarousalBloc = getItInstance<MovieCarousalBloc>();
    movieBackdropBloc = getItInstance<MovieBackdropBloc>();
    movieBottomTabsBloc = getItInstance<MovieBottomTabsBloc>();
    searchMovieBloc = getItInstance<SearchMovieBloc>();
    movieCarousalBloc.add(CarousalLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarousalBloc.close();
    movieBackdropBloc.close();
    movieBottomTabsBloc.close();
    searchMovieBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarousalBloc>(
          create: (context) => movieCarousalBloc,
        ),
        BlocProvider<MovieBackdropBloc>(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider<MovieBottomTabsBloc>(
          create: (context) => movieBottomTabsBloc,
        ),
        BlocProvider<SearchMovieBloc>(
          create: (context) => searchMovieBloc,
        )
      ],
      child: Scaffold(
        drawer: const MovieNavigationDrawer(),
        body: BlocBuilder<MovieCarousalBloc, MovieCarousalState>(
          bloc: movieCarousalBloc,
          builder: (context, state) {
            if (state is MovieCarousalLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarousalWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieBottomTabsListsWidget(),
                  )
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
