import 'package:movieapp/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class GetTrending {
  final MovieRepository repository;

  GetTrending(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getTrending();
  }
}
