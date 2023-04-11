import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:gowatch/common/common.dart';

part 'watchlist_mdl.g.dart';

@HiveType(typeId: 0)
class WatchlistMdl extends Equatable {
  const WatchlistMdl({
    required this.id,
    required this.type,
    required this.title,
    this.posterPath,
    this.addedTimeStamp,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final WatchlistType type;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? posterPath;
  @HiveField(4)
  final DateTime? addedTimeStamp;

  @override
  List<Object?> get props => [id, type, title, posterPath, addedTimeStamp];
}
