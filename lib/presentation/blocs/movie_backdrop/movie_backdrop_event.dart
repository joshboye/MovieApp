part of 'movie_backdrop_bloc.dart';

sealed class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object> get props => [];
}

class MovieBackdropChangedEvent extends MovieBackdropEvent {
  final MovieEntity movies;

  MovieBackdropChangedEvent(this.movies);

  @override
  List<Object> get props => [
        movies
      ];
}
