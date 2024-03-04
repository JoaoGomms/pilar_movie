import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db_app/src/config/http_client.dart/main.dart';
import 'package:movie_db_app/src/error/failure.dart';
import 'package:movie_db_app/src/services/movie_service.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  group('MovieService', () {
    late MockHttpClient mockHttpClient;
    late MovieService movieService;

    setUp(() {
      mockHttpClient = MockHttpClient();
      movieService = MovieService(mockHttpClient);
    });

    test('getTrendingMovies returns a list of movies on successful response',
        () async {
      // Arrange
      final response = http.Response(
          '{"results": [{"id": 1, "title": "Movie 1"}, {"id": 2, "title": "Movie 2"}]}',
          200);
      when(() => mockHttpClient.get('/trending/movie/day'))
          .thenAnswer((_) async => response);

      // Act
      final movies = await movieService.getTrendingMovies();

      // Assert
      expect(movies.length, 2);
      expect(movies[0].id, 1);
      expect(movies[0].title, 'Movie 1');
      expect(movies[1].id, 2);
      expect(movies[1].title, 'Movie 2');
    });

    test('getTrendingMovies throws Failure on non-200 status code', () async {
      // Arrange
      final response = http.Response('{"error": "Not Found"}', 404);
      when(() => mockHttpClient.get('/trending/movie/day'))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(() => movieService.getTrendingMovies(),
          throwsA(isInstanceOf<Failure>()));
    });

    test('getPopularMovies returns a list of movies on successful response',
        () async {
      // Arrange
      final response = http.Response(
          '{"results": [{"id": 1, "title": "Movie 1"}, {"id": 2, "title": "Movie 2"}]}',
          200);
      when(() => mockHttpClient.get('/movie/popular'))
          .thenAnswer((_) async => response);

      // Act
      final movies = await movieService.getPopularMovies();

      // Assert
      expect(movies.length, 2);
      expect(movies[0].id, 1);
      expect(movies[0].title, 'Movie 1');
      expect(movies[1].id, 2);
      expect(movies[1].title, 'Movie 2');
    });

    test('getPopularMovies throws Failure on non-200 status code', () async {
      // Arrange
      final response = http.Response('{"error": "Not Found"}', 404);
      when(() => mockHttpClient.get('/movie/popular'))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(() => movieService.getPopularMovies(),
          throwsA(isInstanceOf<Failure>()));
    });
    test('getUpComingMovies returns a list of movies on successful response',
        () async {
      // Arrange
      final response = http.Response(
          '{"results": [{"id": 1, "title": "Movie 1"}, {"id": 2, "title": "Movie 2"}]}',
          200);
      when(() => mockHttpClient.get('/movie/upcoming'))
          .thenAnswer((_) async => response);

      // Act
      final movies = await movieService.getUpComingMovies();

      // Assert
      expect(movies.length, 2);
      expect(movies[0].id, 1);
      expect(movies[0].title, 'Movie 1');
      expect(movies[1].id, 2);
      expect(movies[1].title, 'Movie 2');
    });

    test('getUpComingMovies throws Failure on non-200 status code', () async {
      // Arrange
      final response = http.Response('{"error": "Not Found"}', 404);
      when(() => mockHttpClient.get('/movie/upcoming'))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(() => movieService.getUpComingMovies(),
          throwsA(isInstanceOf<Failure>()));
    });
    test('getNowPlayingMovies returns a list of movies on successful response',
        () async {
      // Arrange
      final response = http.Response(
          '{"results": [{"id": 1, "title": "Movie 1"}, {"id": 2, "title": "Movie 2"}]}',
          200);
      when(() => mockHttpClient.get('/movie/now_playing'))
          .thenAnswer((_) async => response);

      // Act
      final movies = await movieService.getNowPlayingMovies();

      // Assert
      expect(movies.length, 2);
      expect(movies[0].id, 1);
      expect(movies[0].title, 'Movie 1');
      expect(movies[1].id, 2);
      expect(movies[1].title, 'Movie 2');
    });

    test('getNowPlayingMovies throws Failure on non-200 status code', () async {
      // Arrange
      final response = http.Response('{"error": "Not Found"}', 404);
      when(() => mockHttpClient.get('/movie/now_playing'))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(() => movieService.getNowPlayingMovies(),
          throwsA(isInstanceOf<Failure>()));
    });

    test('fetchMovieCredits returns a list of cast on successful response',
        () async {
      // Arrange
      const movieId = 123;
      final response = http.Response(
        '{"cast": [{"profile_path": "Test", "name": "Actor 1"}, {"profile_path": "Test 2", "name": "Actor 2"}]}',
        200,
      );
      when(() => mockHttpClient.get('/movie/$movieId/credits'))
          .thenAnswer((_) async => response);

      // Act
      final credits = await movieService.fetchMovieCredits(movieId);

      // Assert
      expect(credits.length, 2);
      expect(credits[0].profilePath, "Test");
      expect(credits[0].name, 'Actor 1');
      expect(credits[1].profilePath, "Test 2");
      expect(credits[1].name, 'Actor 2');
    });

    test('fetchMovieCredits throws Failure on non-200 status code', () async {
      // Arrange
      const movieId = 123;
      final response = http.Response('{"error": "Not Found"}', 404);
      when(() => mockHttpClient.get('/movie/$movieId/credits'))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(() => movieService.fetchMovieCredits(movieId),
          throwsA(isInstanceOf<Failure>()));
    });

    test('fetchMovieSearch returns a list of movies on successful response',
        () async {
      // Arrange
      const search = 'Avengers';
      final response = http.Response(
        '{"results": [{"id": 1, "title": "Avengers: Endgame"}, {"id": 2, "title": "Avengers: Infinity War"}]}',
        200,
      );
      when(() => mockHttpClient
              .get('/search/multi', queryParameters: {'query': search}))
          .thenAnswer((_) async => response);

      // Act
      final movies = await movieService.fetchMovieSearch(search);

      // Assert
      expect(movies.length, 2);
      expect(movies[0].id, 1);
      expect(movies[0].title, 'Avengers: Endgame');
      expect(movies[1].id, 2);
      expect(movies[1].title, 'Avengers: Infinity War');
    });

    test('fetchMovieSearch throws Failure on non-200 status code', () async {
      // Arrange
      const search = 'Avengers';
      final response = http.Response('{"error": "Not Found"}', 404);
      when(() => mockHttpClient
              .get('/search/multi', queryParameters: {'query': search}))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(() => movieService.fetchMovieSearch(search),
          throwsA(isInstanceOf<Failure>()));
    });
  });
}
