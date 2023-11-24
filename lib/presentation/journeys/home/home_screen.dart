import 'package:flutter/material.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';

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
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: Placeholder(
              color: Colors.grey,
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.4,
            child: Placeholder(
              color: Colors.greenAccent,
            ),
          )
        ],
      ),
    );
  }
}
