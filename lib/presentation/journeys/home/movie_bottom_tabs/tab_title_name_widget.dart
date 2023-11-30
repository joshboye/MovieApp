import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/themes/theme_colors.dart';

class TabTitleNameWidget extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isSelected;

  final LinearGradient _gradient = const LinearGradient(colors: [
    AppColor.violet,
    AppColor.royalBlue
  ]);

  const TabTitleNameWidget({super.key, this.isSelected = false, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.deepPurple : Colors.transparent,
                width: Sizes.dimen_2.h,
              ),
            ),
          ),
          child: isSelected
              ? ShaderMask(
                  shaderCallback: (Rect rect) {
                    return _gradient.createShader(rect);
                  },
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.dimen_18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.dimen_18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )),
    );
  }
}
