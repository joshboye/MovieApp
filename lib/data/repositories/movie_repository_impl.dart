import 'package:movieapp/data/data_sources/movie_remote_ds.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class MovieRepositoryImplementation extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImplementation(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return movies;
    } catch (e) {
      throw Exception('something went wrong');
    }
  }

  @override
  Future<List<MovieEntity>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return movies;
    } catch (e) {
      throw Exception('something went wrong');
    }
  }

  @override
  Future<List<MovieEntity>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return movies;
    } catch (e) {
      throw Exception('something went wrong');
    }
  }

  @override
  Future<List<MovieEntity>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return movies;
    } catch (e) {
      throw Exception('something went wrong');
    }
  }
}
