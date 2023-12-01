import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/search_params_entity.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class GetSearchedMovies {
  final MovieRepository movieRepository;

  GetSearchedMovies(this.movieRepository);

  Future<List<MovieEntity>> call(SearchParams searchParams) async {
    return await movieRepository.getSearchedMovies(searchParams.searchParam);
  }
}
