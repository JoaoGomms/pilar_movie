import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:movie_db_app/src/error/failure.dart';
import 'package:movie_db_app/src/models/movie_model.dart';
import 'package:movie_db_app/src/services/movie_service.dart';

import '../models/cast_model.dart';

part 'movies_store.g.dart';

class MoviesStore = MoviesStoreBase with _$MoviesStore;

abstract class MoviesStoreBase with Store {
  final MovieService service;

  MoviesStoreBase(this.service);

  ObservableList<Movie> trendingMovies = ObservableList<Movie>();
  ObservableList<Movie> popularMovies = ObservableList<Movie>();
  ObservableList<Movie> upComingMovies = ObservableList<Movie>();
  ObservableList<Movie> nowPlayingMovies = ObservableList<Movie>();
  ObservableList<Movie> searchMovies = ObservableList<Movie>();

  Future<List<Movie>> fetchTrendingMovies() async {
    var movies = await service.getTrendingMovies();
    trendingMovies.addAll(movies);
    return trendingMovies.toList();
  }

  Future<List<Movie>> fetchPopularMovies() async {
    var movies = await service.getPopularMovies();
    popularMovies.addAll(movies);
    return popularMovies.toList();
  }

  Future<List<Movie>> fetchUpComingMovies() async {
    var movies = await service.getUpComingMovies();
    upComingMovies.addAll(movies);
    return upComingMovies.toList();
  }

  Future<List<Movie>> fetchNowPlayingMovies() async {
    var movies = await service.getNowPlayingMovies();
    nowPlayingMovies.addAll(movies);
    return nowPlayingMovies.toList();
  }

  Future<List<Cast>> fetchMovieCredits(int movieId) async {
    return await service.fetchMovieCredits(movieId);
  }

  Future<List<Movie>> fetchSearchMovies(String search) async {
    var movies = await service.fetchMovieSearch(search);
    searchMovies.clear();
    searchMovies.addAll(movies);
    return searchMovies.toList();
  }
}
