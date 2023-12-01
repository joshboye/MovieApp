import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/models/movie_results_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon(); 
  Future<List<MovieModel>> getSearchedMovies(String searchTerm);
}

class MovieRemoteDataSourceImplemented extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImplemented(this._client);

  @override
  Future<List<MovieModel>> getPopular() async {
    final responsefromclient = await _client.get('/movie/popular');
    final movies = MoviesResult.fromJson(responsefromclient).movies;
    if (movies != null) {
      print(movies);
      return movies;
    } else {
      throw Exception('the movies popular are null');
    }
  }

  @override
  Future<List<MovieModel>> getTrending() async {
    final responsefromclient = await _client.get('/trending/movie/day');
    final movies = MoviesResult.fromJson(responsefromclient).movies;
    if (movies != null) {
      print(movies);
      return movies;
    } else {
      throw Exception('the movies Trending are null');
    }
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final responsefromclient = await _client.get('/trending/movie/day');
    final movies = MoviesResult.fromJson(responsefromclient).movies;
    if (movies != null) {
      print(movies);
      return movies;
    } else {
      throw Exception('the movies coming soon are null');
    }
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final responsefromclient = await _client.get('/trending/movie/day');
    final movies = MoviesResult.fromJson(responsefromclient).movies;
    if (movies != null) {
      print(movies);
      return movies;
    } else {
      throw Exception('the movies plyaing now are null');
    }
  }
  
  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm) async {
    final responsefromclient = await _client.get('/search/movies', params: {'query': searchTerm});
    final movies = MoviesResult.fromJson(responsefromclient).movies;
    if (movies != null) {
      print(movies);
      return movies;
    } else {
      throw Exception('the movies plyaing now are null');
    }
  }
}
