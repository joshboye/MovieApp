part of 'movie_backdrop_bloc.dart';

sealed class MovieBackdropState extends Equatable {
  const MovieBackdropState();
  
  @override
  List<Object> get props => [];
}

final class MovieBackdropInitial extends MovieBackdropState {}