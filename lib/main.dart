import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await ScreenUtil.ensureScreenSize();
  runApp(const MovieApp());
}
