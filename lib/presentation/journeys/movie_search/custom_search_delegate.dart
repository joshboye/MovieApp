import 'package:flutter/material.dart';
import 'package:movieapp/presentation/blocs/search_movie/search_movie_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      SizedBox.shrink()
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
