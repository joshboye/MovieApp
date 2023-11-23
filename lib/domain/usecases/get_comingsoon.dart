import 'package:movieapp/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class GetComingSoon {
  final MovieRepository repository;

  GetComingSoon(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getComingSoon();
  }
}
