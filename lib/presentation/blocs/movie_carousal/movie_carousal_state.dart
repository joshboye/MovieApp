part of 'movie_carousal_bloc.dart';

sealed class MovieCarousalState extends Equatable {
  const MovieCarousalState();

  @override
  List<Object> get props => [];
}

final class MovieCarousalInitial extends MovieCarousalState {}

final class MovieCarousalError extends MovieCarousalState {}

final class MovieCarousalLoaded extends MovieCarousalState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarousalLoaded({this.defaultIndex = 0, required this.movies}) : assert(defaultIndex >= 0, 'Index should be greater than 0');

  @override
  List<Object> get props => [
        defaultIndex,
        movies
      ];
}
