import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousal/movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCardWidget({
    super.key,
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.1).clamp(0.0, 1.0));
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) * ScreenUtil().screenHeight * 0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        }
      },
      animation: pageController,
      child: MovieCardWidget(movieId: movieId, posterPath: posterPath),
    );
  }
}
