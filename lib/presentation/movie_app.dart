import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/presentation/journeys/home/home_screen.dart';
import 'package:movieapp/presentation/themes/theme_colors.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(414, 896));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
