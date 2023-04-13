import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';

import 'db/hive_local_database.dart';

abstract class LocalDataSource {
  List<WatchlistMdl> getWatchlist();
  void addWatchlist(WatchlistMdl watchlist);
  void removeWatchlist(String id);
  bool checkWatchlistStatus(String watchlistId);
}

class LocalDataSourceImpl implements LocalDataSource {
  final HiveLocalDatabase hiveDatabase;

  LocalDataSourceImpl({required this.hiveDatabase});

  @override
  List<WatchlistMdl> getWatchlist() {
    try {
      final box = hiveDatabase.getWatchlist();

      //Sort by added timestamp
      final sorted = box.values.toList()
        ..sort(((a, b) => b.addedTimeStamp!.compareTo(a.addedTimeStamp!)));

      return sorted.map((watchlist) => watchlist).toList();
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  void addWatchlist(WatchlistMdl watchlist) {
    try {
      hiveDatabase.addWatchlist(watchlist);
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  void removeWatchlist(String watchlistId) {
    try {
      hiveDatabase.removeWatchlist(watchlistId);
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  bool checkWatchlistStatus(String watchlistId) {
    try {
      return hiveDatabase.checkWatchlistStatus(watchlistId);
    } catch (e) {
      throw DatabaseException();
    }
  }
}
