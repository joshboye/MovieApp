import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/themes/theme_colors.dart';

class Seperator extends StatelessWidget {
  const Seperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Sizes.dimen_1,
        width: Sizes.dimen_80,
        padding: EdgeInsets.only(top: Sizes.dimen_4.h, bottom: Sizes.dimen_4.h),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor.violet,
          AppColor.royalBlue
        ])));
  }
}
