import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svgs/menu.svg',
                height: Sizes.dimen_25.h,
              )),
          Expanded(child: Logo(height: Sizes.dimen_25.h)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: Sizes.dimen_25.h,
              )),
        ],
      ),
    );
  }
}
