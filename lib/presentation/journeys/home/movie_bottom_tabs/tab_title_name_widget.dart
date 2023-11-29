import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';

class TabTitleNameWidget extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isSelected;

  const TabTitleNameWidget({super.key, this.isSelected = false, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.deepPurple : Colors.transparent,
              width: Sizes.dimen_2.h,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? TextStyle(
                  color: Colors.deepPurple,
                  fontSize: Sizes.dimen_17.sp,
                  fontWeight: FontWeight.w400,
                )
              : TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.dimen_16.sp,
                  fontWeight: FontWeight.w400,
                ),
        ),
      ),
    );
  }
}
