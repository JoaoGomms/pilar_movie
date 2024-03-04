import 'dart:convert';

import 'package:movie_db_app/src/config/http_client.dart/main.dart';
import 'package:movie_db_app/src/models/cast_model.dart';

import '../error/failure.dart';
import '../models/movie_model.dart';
import '../models/text_model.dart';

class MovieService {
  final HttpClient client;
  final TextModel text = TextModel();

  MovieService(this.client);

  String statusCodeToMessage(int statusCode) {
    switch (statusCode) {
      case 200:
        return text.sucess;
      case 404:
        return text.notFound;
      case 500:
        return text.serverError;
      default:
        return text.unknownError;
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await client.get('/trending/movie/day');

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        final decodeData = json.decode(response.body)['results'] as List;
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      }

      throw Failure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await client.get('/movie/popular');

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        final decodeData = json.decode(response.body)['results'] as List;
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      }

      throw Failure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  Future<List<Movie>> getUpComingMovies() async {
    try {
      final response = await client.get('/movie/upcoming');

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        final decodeData = json.decode(response.body)['results'] as List;
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      }

      throw Failure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    try {
      final response = await client.get('/movie/now_playing');

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        final decodeData = json.decode(response.body)['results'] as List;
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      }

      throw Failure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  Future<List<Cast>> fetchMovieCredits(int movieId) async {
    try {
      final response = await client.get('/movie/$movieId/credits');

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        final decodeData = json.decode(response.body)['cast'] as List;
        return decodeData.map((i) => Cast.fromJson(i)).toList();
      }

      throw Failure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  Future<List<Movie>> fetchMovieSearch(String search) async {
    try {
      final response =
          await client.get('/search/multi', queryParameters: {'query': search});

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        final decodeData = json.decode(response.body)['results'] as List;
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      }

      throw Failure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }
}
