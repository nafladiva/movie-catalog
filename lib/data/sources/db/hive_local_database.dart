import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:hive/hive.dart';

class HiveLocalDatabase {
  Box<WatchlistMdl> getWatchlist() {
    return Hive.box<WatchlistMdl>(MyConsts.watchlistBox);
  }

  void addWatchlist(WatchlistMdl watchlist) {
    Hive.box<WatchlistMdl>(MyConsts.watchlistBox).put(watchlist.id, watchlist);
  }

  void removeWatchlist(int id) {
    Hive.box<WatchlistMdl>(MyConsts.watchlistBox).delete(id);
  }

  bool checkWatchlistStatus(int id) {
    return Hive.box<WatchlistMdl>(MyConsts.watchlistBox).containsKey(id);
  }
}
