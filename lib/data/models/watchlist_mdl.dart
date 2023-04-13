import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'watchlist_mdl.g.dart';

@HiveType(typeId: 0)
class WatchlistMdl extends Equatable {
  const WatchlistMdl({
    required this.id,
    required this.title,
    this.posterPath,
    this.addedTimeStamp,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? posterPath;
  @HiveField(3)
  final DateTime? addedTimeStamp;

  @override
  List<Object?> get props => [id, title, posterPath, addedTimeStamp];
}
