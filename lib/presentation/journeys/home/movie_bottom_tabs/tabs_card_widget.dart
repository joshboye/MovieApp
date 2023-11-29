import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/data/core/api_constants.dart';

class TabsCardWidget extends StatelessWidget {
  final String title, posterPath;
  final int movieId;
  const TabsCardWidget({super.key, required this.title, required this.posterPath, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: Sizes.dimen_230.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_4.h),
              child: Text(
                title,
                style: TextStyle(fontSize: Sizes.dimen_12.sp, fontWeight: FontWeight.w400, color: Colors.white),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
