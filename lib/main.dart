import 'package:flutter/material.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/movie_app.dart';

void main() async {
  await init();
  runApp(const MovieApp());
}
