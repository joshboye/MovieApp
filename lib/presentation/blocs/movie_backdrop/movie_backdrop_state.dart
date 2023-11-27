part of 'movie_backdrop_bloc.dart';

sealed class MovieBackdropState extends Equatable {
  const MovieBackdropState();

  @override
  List<Object> get props => [];
}

final class MovieBackdropInitial extends MovieBackdropState {}

final class MovieBackdropChanged extends MovieBackdropState {
  final MovieEntity movies;

  MovieBackdropChanged(this.movies);

  @override
  List<Object> get props => [
        movies
      ];
}
