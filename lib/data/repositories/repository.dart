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
      return Right(result.map((e) => e).toList());
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
      return Right(result.map((e) => e).toList());
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
      return Right(result.map((e) => e).toList());
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
      return Right(result.map((e) => e).toList());
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
      return Right(result.map((e) => e).toList());
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
      return Right(result.map((e) => e).toList());
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
}
