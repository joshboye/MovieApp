import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';

import '../../../../data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  const MovieCardWidget({super.key, required this.movieId, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
                value: downloadProgress.progress,
                color: Colors.white,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )),
      ),
    );
  }
}
