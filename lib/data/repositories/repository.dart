import 'package:dartz/dartz.dart';
import 'package:gowatch/common/common.dart';

import '../models/models.dart';
import '../sources/sources.dart';

abstract class Repository {
  Future<Either<Failure, List<MovieMdl>>> getPopularMovies();
  Future<Either<Failure, List<MovieMdl>>> getNowPlayingMovies();
  Future<Either<Failure, MovieMdl>> getDetailMovie(int id);
}

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({
    required this.remoteDataSource,
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
}
