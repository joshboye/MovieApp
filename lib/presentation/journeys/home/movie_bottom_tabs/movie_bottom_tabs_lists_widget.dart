import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/blocs/movie_bottom_tabs/movie_bottom_tabs_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_bottom_tabs/movie_list_view_builder.dart';
import 'package:movieapp/presentation/journeys/home/movie_bottom_tabs/tab_title_name_widget.dart';
import 'package:movieapp/presentation/journeys/home/movie_bottom_tabs/tabs.dart';

class MovieBottomTabsListsWidget extends StatefulWidget {
  const MovieBottomTabsListsWidget({super.key});

  @override
  State<MovieBottomTabsListsWidget> createState() => _MovieBottomTabsListsWidgetState();
}

class _MovieBottomTabsListsWidgetState extends State<MovieBottomTabsListsWidget> with SingleTickerProviderStateMixin {
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
          padding: EdgeInsets.only(top: 4.0.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  for (var i = 0; i < tabs.movieTabs.length; i++)
                    TabTitleNameWidget(
                      onTap: () => _onTapFunction(i),
                      title: tabs.movieTabs[i].title,
                      isSelected: tabs.movieTabs[i].index == state.currentTabIndex,
                    )
                ],
              ),
              SizedBox(
                height: Sizes.dimen_8.h,
              ),
              if (state is MovieBottomTabsChanged) Expanded(child: MovieListViewBuilder(movies: state.movies))
            ],
          ),
        );
      },
    );
  }

  void _onTapFunction(int index) {
    movieBottomTabsBloc.add(MovieBottomTabsChangedEvent(index));
  }
}
