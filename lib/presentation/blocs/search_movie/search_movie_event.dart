part of 'search_movie_bloc.dart';

sealed class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object> get props => [];
}

class MovieSearchTermChanged extends SearchMovieEvent {
  final String changedMovieTerm;

  const MovieSearchTermChanged(this.changedMovieTerm);

  @override
  List<Object> get props => [
        changedMovieTerm
      ];
}
