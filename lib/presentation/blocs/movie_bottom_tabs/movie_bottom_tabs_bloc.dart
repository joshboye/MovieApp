import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/usecases/get_comingsoon.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';

part 'movie_bottom_tabs_event.dart';
part 'movie_bottom_tabs_state.dart';

class MovieBottomTabsBloc extends Bloc<MovieBottomTabsEvent, MovieBottomTabsState> {
  final GetPlopular getPlopular;
  final GetComingSoon getComingSoon;
  final GetTrending getTrending;
  MovieBottomTabsBloc(this.getComingSoon, this.getPlopular, this.getTrending) : super(MovieBottomTabsInitial()) {
    on<MovieBottomTabsEvent>((event, emit) async {
      if (event is MovieBottomTabsChangedEvent) {
        List<MovieEntity> movies = [];
        switch (event.currentTabIndex) {
          case 0:
            movies = await getPlopular();
            break;
          case 1:
            movies = await getComingSoon();
            break;
          case 2:
            movies = await getTrending();
            break;
        }
        emit(MovieBottomTabsChanged(event.currentTabIndex, movies));
      }
    });
  }
}
