import 'dart:convert';

import 'package:gowatch/common/common.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

abstract class RemoteDataSource {
  Future<List<MovieMdl>> getPopularMovies();
  Future<List<MovieMdl>> getNowPlayingMovies();
  Future<MovieMdl> getDetailMovie(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<MovieMdl>> getPopularMovies() async {
    try {
      final res = await http.get(
        Uri.parse(
            '${MyConsts.baseUrl}/movie/popular?api_key=${MyConsts.apiKey}'),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body)['results'];
        return List<MovieMdl>.from(decoded.map((x) => MovieMdl.fromMap(x)));
      } else if (res.statusCode == 404) {
        throw DataException();
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieMdl>> getNowPlayingMovies() async {
    try {
      final res = await http.get(
        Uri.parse(
            '${MyConsts.baseUrl}/movie/now_playing?api_key=${MyConsts.apiKey}'),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body)['results'];
        return List<MovieMdl>.from(decoded.map((x) => MovieMdl.fromMap(x)));
      } else if (res.statusCode == 404) {
        throw DataException();
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<MovieMdl> getDetailMovie(int id) async {
    try {
      final res = await http.get(
        Uri.parse('${MyConsts.baseUrl}/movie/$id?api_key=${MyConsts.apiKey}'),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body);
        return MovieMdl.fromMap(decoded);
      } else if (res.statusCode == 404) {
        throw DataException();
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
