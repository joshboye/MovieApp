import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/journeys/home/movie_bottom_tabs/tabs_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final MovieEntity movie = movies[index];

        return TabsCardWidget(
          movieId: movie.id ?? 0,
          title: movie.title ?? '',
          posterPath: movie.posterPath ?? '',
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: Sizes.dimen_10.w,
        );
      },
      itemCount: movies.length,
    );
  }
}
