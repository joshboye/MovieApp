import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int? id;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;

  const MovieEntity(
    this.id,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
  ) : assert(id != null, 'Movie ID must no be null');

  @override
  List<Object?> get props => [
        id,
        title
      ];

  @override
  bool get stringify => true;
}
