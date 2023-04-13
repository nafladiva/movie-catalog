import 'package:dartz/dartz.dart';
import 'package:gowatch/common/common.dart';

import '../models/models.dart';
import '../sources/sources.dart';

abstract class Repository {
  //Movie
  Future<Either<Failure, List<MovieMdl>>> getPopularMovies();
  Future<Either<Failure, List<MovieMdl>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieMdl>>> getNowPlayingMovies();
  Future<Either<Failure, MovieMdl>> getDetailMovie(int id);

  //TV Show
  Future<Either<Failure, List<TVShowMdl>>> getPopularTVShows();
  Future<Either<Failure, List<TVShowMdl>>> getTopRatedTVShows();
  Future<Either<Failure, List<TVShowMdl>>> getOnTheAirTVShows();
  Future<Either<Failure, TVShowMdl>> getDetailTVShow(int id);

  Future<Either<Failure, List<WatchlistMdl>>> getWatchlist();
  Future<Either<Failure, bool>> checkWatchlistStatus(String watchlistId);
  Future<Either<Failure, String>> addToWatchlist(WatchlistMdl watchlist);
  Future<Either<Failure, String>> removeFromWatchlist(String watchlistId);
}

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<MovieMdl>>> getPopularMovies() async {
    try {
      final result = await remoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieMdl>>> getTopRatedMovies() async {
    try {
      final result = await remoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieMdl>>> getNowPlayingMovies() async {
    try {
      final result = await remoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, MovieMdl>> getDetailMovie(int id) async {
    try {
      final result = await remoteDataSource.getDetailMovie(id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, List<TVShowMdl>>> getOnTheAirTVShows() async {
    try {
      final result = await remoteDataSource.getOnTheAirTVShows();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, List<TVShowMdl>>> getPopularTVShows() async {
    try {
      final result = await remoteDataSource.getPopularTVShows();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, List<TVShowMdl>>> getTopRatedTVShows() async {
    try {
      final result = await remoteDataSource.getTopRatedTVShows();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, TVShowMdl>> getDetailTVShow(int id) async {
    try {
      final result = await remoteDataSource.getDetailTVShow(id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, List<WatchlistMdl>>> getWatchlist() async {
    try {
      final result = localDataSource.getWatchlist();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, String>> addToWatchlist(
    WatchlistMdl watchlist,
  ) async {
    try {
      localDataSource.addWatchlist(watchlist);
      return const Right('Added to watchlist!');
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, String>> removeFromWatchlist(
    String watchlistId,
  ) async {
    try {
      localDataSource.removeWatchlist(watchlistId);
      return const Right('Removed from watchlist');
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> checkWatchlistStatus(String watchlistId) async {
    try {
      final result = localDataSource.checkWatchlistStatus(watchlistId);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    } on DataException {
      return const Left(DataFailure());
    }
  }
}
