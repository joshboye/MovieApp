part of 'movie_bottom_tabs_bloc.dart';

sealed class MovieBottomTabsState extends Equatable {
  final int currentTabIndex;
  const MovieBottomTabsState({this.currentTabIndex = 0});

  @override
  List<Object> get props => [
        currentTabIndex
      ];
}

final class MovieBottomTabsInitial extends MovieBottomTabsState {}

final class MovieBottomTabsChanged extends MovieBottomTabsState {
  final List<MovieEntity> movies;

  MovieBottomTabsChanged(int currentTabIndex, this.movies) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [
        currentTabIndex,
        movies
      ];
}

final class MovieBottomTabsError extends MovieBottomTabsState {
  MovieBottomTabsError(int currentTabIndex) : super(currentTabIndex: currentTabIndex);
}
