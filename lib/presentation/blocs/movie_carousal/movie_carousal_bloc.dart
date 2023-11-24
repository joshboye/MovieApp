import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';

part 'movie_carousal_event.dart';
part 'movie_carousal_state.dart';

class MovieCarousalBloc extends Bloc<MovieCarousalEvent, MovieCarousalState> {
  GetTrending getTrending;
  MovieCarousalBloc({
    required this.getTrending,
  }) : super(MovieCarousalInitial()) {
    on<MovieCarousalEvent>((event, emit) async {
      if (event is CarousalLoadEvent) {
        try {
          final movies = await getTrending();
          emit(MovieCarousalLoaded(movies: movies, defaultIndex: event.defaultIndex));
        } catch (e) {
          print('some error in moviecarousalevent(inside moviecaroualbloc) with the error ${e}');
          emit(MovieCarousalError());
        }
      }
    });
  }
}
