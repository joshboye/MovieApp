import 'package:movieapp/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class GetPlopular {
  final MovieRepository repository;

  GetPlopular(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getPopular();
  }
}
