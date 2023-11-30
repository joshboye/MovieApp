part of 'search_movie_bloc.dart';

sealed class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchedMovieLoaded extends SearchMovieState {
  final List<MovieEntity> movies;
  final String changedMovieTerm;

  const SearchedMovieLoaded(this.movies, this.changedMovieTerm);

  @override
  List<Object> get props => [
        movies,
        changedMovieTerm
      ];
}

final class SearchedMovieLoading extends SearchMovieState {}

final class SearchedMovieError extends SearchMovieState {}
