import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_db_app/src/modules/movies/data/models/cast_model.dart';
import 'package:movie_db_app/src/modules/movies/data/models/movie_model.dart';
import 'package:movie_db_app/src/modules/movies/data/services/movie_service.dart';
import 'package:movie_db_app/src/modules/movies/stores/movies_store.dart';

class MovieServiceMock with Mock implements MovieService {}

class MovieFake with Fake implements Movie {}

class CastFake with Fake implements Cast {}

void main() {
  MovieService serviceMock = MovieServiceMock();
  MoviesStore store;

  test('Should return a list of Movies for the Trending Type', () async {
    // arrange
    when(
      () => serviceMock.getTrendingMovies(),
    ).thenAnswer((_) async => <Movie>[MovieFake()]);

    store = MoviesStore(serviceMock);

    // act
    final result = await store.fetchTrendingMovies();

    // assert
    expect(result, isA<List<Movie>>());
    expect(result.length, 1);
    expect(store.trendingMovies, isNotEmpty);
  });

  test('Should return a list of Movies for the Popular Type', () async {
    // arrange
    when(
      () => serviceMock.getPopularMovies(),
    ).thenAnswer((_) async => <Movie>[MovieFake()]);

    store = MoviesStore(serviceMock);

    // act
    final result = await store.fetchPopularMovies();

    // assert
    expect(result, isA<List<Movie>>());
    expect(result.length, 1);
    expect(store.popularMovies, isNotEmpty);
  });

  test('Should return a list of Movies for the Upcoming Type', () async {
    // arrange
    when(
      () => serviceMock.getUpComingMovies(),
    ).thenAnswer((_) async => <Movie>[MovieFake()]);

    store = MoviesStore(serviceMock);

    // act
    final result = await store.fetchUpComingMovies();

    // assert
    expect(result, isA<List<Movie>>());
    expect(result.length, 1);
    expect(store.upComingMovies, isNotEmpty);
  });

  test('Should return a list of Movies for the Now Playing Type', () async {
    // arrange
    when(
      () => serviceMock.getNowPlayingMovies(),
    ).thenAnswer((_) async => <Movie>[MovieFake()]);

    store = MoviesStore(serviceMock);

    // act
    final result = await store.fetchNowPlayingMovies();

    // assert
    expect(result, isA<List<Movie>>());
    expect(result.length, 1);
    expect(store.nowPlayingMovies, isNotEmpty);
  });

  test('Should return a list of Movies for the Search Type', () async {
    // arrange
    when(
      () => serviceMock.fetchMovieSearch('test'),
    ).thenAnswer((_) async => <Movie>[MovieFake()]);

    store = MoviesStore(serviceMock);

    // act
    final result = await store.fetchSearchMovies('test');

    // assert
    expect(result, isA<List<Movie>>());
    expect(result.length, 1);
    expect(store.searchMovies, isNotEmpty);
  });

  test('Should return a list of the cast on the movie', () async {
    // arrange
    when(
      () => serviceMock.fetchMovieCredits(1),
    ).thenAnswer((_) async => <Cast>[CastFake()]);

    store = MoviesStore(serviceMock);

    // act
    final result = await store.fetchMovieCredits(1);

    // assert
    expect(result, isA<List<Cast>>());
    expect(result.length, 1);
  });
}
