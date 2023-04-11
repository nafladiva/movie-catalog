import 'package:equatable/equatable.dart';

import 'genre_mdl.dart';

class TVShowMdl extends Equatable {
  const TVShowMdl({
    this.id,
    this.title,
    this.overview,
    this.genres,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
  });

  final int? id;
  final String? title;
  final String? overview;
  final List<GenreMdl>? genres;
  final String? posterPath;
  final String? backdropPath;
  final DateTime? releaseDate;
  final double? voteAverage;
  final int? voteCount;

  factory TVShowMdl.fromMap(Map<String, dynamic> json) => TVShowMdl(
        id: json["id"],
        title: json["original_title"],
        overview: json["overview"],
        genres: json["genres"] != null
            ? List<GenreMdl>.from(
                (json["genres"] as List).map((x) => GenreMdl.fromMap(x)))
            : null,
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : null,
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        title,
        overview,
        genres,
        posterPath,
        backdropPath,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
