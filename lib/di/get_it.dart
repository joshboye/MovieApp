import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/data_sources/movie_remote_ds.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_comingsoon.dart';
import 'package:movieapp/domain/usecases/get_playingnow.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Dio>(() => Dio());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImplemented(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImplementation(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPlopular>(() => GetPlopular(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));
}
