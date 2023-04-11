import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';

import 'db/hive_local_database.dart';

abstract class LocalDataSource {
  List<WatchlistMdl> getWatchlist();
  void addWatchlist(WatchlistMdl watchlist);
  void removeWatchlist(int id);
  bool checkWatchlistStatus(int id);
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
  void removeWatchlist(int id) {
    try {
      hiveDatabase.removeWatchlist(id);
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  bool checkWatchlistStatus(int id) {
    try {
      return hiveDatabase.checkWatchlistStatus(id);
    } catch (e) {
      throw DatabaseException();
    }
  }
}
