import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/search_params_entity.dart';
import 'package:movieapp/domain/usecases/get_searched_movies.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchedMovies getSearchedMovies;
  SearchMovieBloc(this.getSearchedMovies) : super(SearchMovieInitial()) {
    on<SearchMovieEvent>((event, emit) async {
      if (event is MovieSearchTermChanged) {
        emit(SearchedMovieLoading());
        final List<MovieEntity> movies = await getSearchedMovies(SearchParams(event.changedMovieTerm));
        print(movies);
        emit(SearchedMovieLoaded(movies, event.changedMovieTerm));
      }
    });
  }
}
