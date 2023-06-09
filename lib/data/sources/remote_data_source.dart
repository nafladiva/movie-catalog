import 'dart:convert';

import 'package:gowatch/common/common.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

abstract class RemoteDataSource {
  //Movie
  Future<List<MovieMdl>> getPopularMovies();
  Future<List<MovieMdl>> getTopRatedMovies();
  Future<List<MovieMdl>> getNowPlayingMovies();
  Future<MovieMdl> getDetailMovie(int id);

  //TV Show
  Future<List<TVShowMdl>> getPopularTVShows();
  Future<List<TVShowMdl>> getTopRatedTVShows();
  Future<List<TVShowMdl>> getOnTheAirTVShows();
  Future<TVShowMdl> getDetailTVShow(int id);
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
  Future<List<MovieMdl>> getTopRatedMovies() async {
    try {
      final res = await http.get(
        Uri.parse(
            '${MyConsts.baseUrl}/movie/top_rated?api_key=${MyConsts.apiKey}'),
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

  @override
  Future<List<TVShowMdl>> getOnTheAirTVShows() async {
    try {
      final res = await http.get(
        Uri.parse(
          '${MyConsts.baseUrl}/tv/on_the_air?api_key=${MyConsts.apiKey}',
        ),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body)['results'];
        return List<TVShowMdl>.from(decoded.map((x) => TVShowMdl.fromMap(x)));
      } else if (res.statusCode == 404) {
        throw DataException();
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<TVShowMdl>> getPopularTVShows() async {
    try {
      final res = await http.get(
        Uri.parse(
          '${MyConsts.baseUrl}/tv/popular?api_key=${MyConsts.apiKey}',
        ),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body)['results'];
        return List<TVShowMdl>.from(decoded.map((x) => TVShowMdl.fromMap(x)));
      } else if (res.statusCode == 404) {
        throw DataException();
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<TVShowMdl>> getTopRatedTVShows() async {
    try {
      final res = await http.get(
        Uri.parse(
          '${MyConsts.baseUrl}/tv/top_rated?api_key=${MyConsts.apiKey}',
        ),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body)['results'];
        return List<TVShowMdl>.from(decoded.map((x) => TVShowMdl.fromMap(x)));
      } else if (res.statusCode == 404) {
        throw DataException();
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<TVShowMdl> getDetailTVShow(int id) async {
    try {
      final res = await http.get(
        Uri.parse('${MyConsts.baseUrl}/tv/$id?api_key=${MyConsts.apiKey}'),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body);
        return TVShowMdl.fromMap(decoded);
      } else if (res.statusCode == 404) {
        throw DataException();
      }

      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
