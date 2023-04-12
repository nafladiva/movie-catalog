import 'package:equatable/equatable.dart';
import 'package:gowatch/data/models/models.dart';

class TVShowMdl extends Equatable {
  const TVShowMdl({
    this.id,
    this.title,
    this.overview,
    this.genres,
    this.seasons,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
  });

  final int? id;
  final String? title;
  final String? overview;
  final List<GenreMdl>? genres;
  final List<SeasonMdl>? seasons;
  final String? posterPath;
  final String? backdropPath;
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
        seasons: json["seasons"] != null
            ? List<SeasonMdl>.from(
                (json["seasons"] as List).map((x) => SeasonMdl.fromMap(x)))
            : null,
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
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
        seasons,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
      ];
}
