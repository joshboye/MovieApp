import 'package:movieapp/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class GetPlayingNow {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getPlayingNow();
  }
}
