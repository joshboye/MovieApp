part of 'movie_carousal_bloc.dart';

sealed class MovieCarousalEvent extends Equatable {
  const MovieCarousalEvent();

  @override
  List<Object> get props => [];
}

class CarousalLoadEvent extends MovieCarousalEvent {
  final int defaultIndex;
  const CarousalLoadEvent({this.defaultIndex = 0}) : assert(defaultIndex >= 0, 'Defualt Index should be greater than or equal to 0');

  @override
  List<Object> get props => [
        defaultIndex
      ];
}
