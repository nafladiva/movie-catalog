import 'package:equatable/equatable.dart';

class SeasonMdl extends Equatable {
  const SeasonMdl({
    this.id,
    this.airDate,
    this.episodeCount,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  final int? id;
  final DateTime? airDate;
  final int? episodeCount;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;

  factory SeasonMdl.fromMap(Map<String, dynamic> json) => SeasonMdl(
        id: json["id"],
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodeCount: json["episode_count"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
      );

  @override
  List<Object?> get props => [
        id,
        airDate,
        episodeCount,
        name,
        overview,
        posterPath,
        seasonNumber,
      ];
}
