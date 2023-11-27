import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousal/movie_card_widget.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousal/movie_page_view.dart';
import 'package:movieapp/presentation/widgets/movie_app_bar.dart';

class MovieCarousalWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarousalWidget({super.key, required this.movies, required this.defaultIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieAppBar(),
        MoviePageView(initialPage: defaultIndex, movies: movies)
      ],
    );
  }
}
