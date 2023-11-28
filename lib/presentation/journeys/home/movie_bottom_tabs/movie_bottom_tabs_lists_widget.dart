import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_bottom_tabs/movie_bottom_tabs_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_bottom_tabs/movie_list_view_builder.dart';
import 'package:movieapp/presentation/journeys/home/movie_bottom_tabs/tab_title_name_widget.dart';
import 'package:movieapp/presentation/journeys/home/movie_bottom_tabs/tabs.dart';

class MovieBottomTabsListsWidget extends StatefulWidget {
  const MovieBottomTabsListsWidget({super.key});

  @override
  State<MovieBottomTabsListsWidget> createState() => _MovieBottomTabsListsWidgetState();
}

class _MovieBottomTabsListsWidgetState extends State<MovieBottomTabsListsWidget> {
  MovieBottomTabsBloc get movieBottomTabsBloc => BlocProvider.of<MovieBottomTabsBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieBottomTabsBloc.add(MovieBottomTabsChangedEvent(currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
    movieBottomTabsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = Tabs();
    return BlocBuilder<MovieBottomTabsBloc, MovieBottomTabsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  for (var i = 0; i < tabs.movieTabs.length; i++)
                    TabTitleNameWidget(
                      onTap: () {
                        movieBottomTabsBloc.add(MovieBottomTabsChangedEvent(i));
                      },
                      title: tabs.movieTabs[i].title,
                      isSelected: tabs.movieTabs[i].index == state.currentTabIndex,
                    )
                ],
              ),
              if (state is MovieBottomTabsChanged) Expanded(child: MovieListViewBuilder(movies: state.movies))
            ],
          ),
        );
      },
    );
  }
}
