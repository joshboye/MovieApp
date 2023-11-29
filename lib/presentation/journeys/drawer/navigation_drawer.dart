import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';

class MovieNavigationDrawer extends StatelessWidget {
  const MovieNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.7), blurRadius: 4)
      ]),
    );
  }
}
