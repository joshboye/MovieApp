part of 'movie_bottom_tabs_bloc.dart';

sealed class MovieBottomTabsEvent extends Equatable {
  const MovieBottomTabsEvent();

  @override
  List<Object> get props => [];
}

class MovieBottomTabsChangedEvent extends MovieBottomTabsEvent {
  final int currentTabIndex;

  MovieBottomTabsChangedEvent(this.currentTabIndex);

  @override
  List<Object> get props => [
        currentTabIndex
      ];
}
