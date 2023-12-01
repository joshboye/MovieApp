import 'package:movieapp/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getTrending();
  Future<List<MovieEntity>> getPopular();
  Future<List<MovieEntity>> getPlayingNow();
  Future<List<MovieEntity>> getComingSoon();
  Future<List<MovieEntity>> getSearchedMovies(String searchTerm);

}
