import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';
import 'package:movieapp/presentation/widgets/movie_carousal_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarousalBloc movieCarousalBloc;
  @override
  void initState() {
    super.initState();
    movieCarousalBloc = getItInstance<MovieCarousalBloc>();
    movieCarousalBloc.add(CarousalLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarousalBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCarousalBloc>(
      create: (context) => movieCarousalBloc,
      child: Scaffold(
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
                    child: Placeholder(
                      color: Colors.greenAccent,
                    ),
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
