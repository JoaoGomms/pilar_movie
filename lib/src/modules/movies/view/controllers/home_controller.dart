import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_db_app/src/modules/movies/view/components/widget_status_enum.dart';
import 'package:movie_db_app/src/modules/movies/stores/movies_store.dart';

import '../../data/models/movie_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MoviesStore movieStore;

  _HomeControllerBase(this.movieStore) {
    fetchCarouselMovies();
    fetchNowPlayingMovies();
    fetchUpComingMovies();
  }

  @observable
  TextEditingController textEditingController = TextEditingController();

  bool showPopularMoviesInCarousel = true;

  void setShowPopularMoviesInCarousel(bool value) {
    toggleCarouselOption(value);
  }

  @observable
  WidgetStatus? nowPlayingMoviesStatus;

  @observable
  WidgetStatus? upComingMoviesStatus;

  @observable
  WidgetStatus? carouselMoviesStatus;

  @observable
  List<Movie> carouselMovies = [];

  ObservableList<Movie>? get popularMovies => movieStore.popularMovies;

  ObservableList<Movie>? get trendingMovies => movieStore.trendingMovies;

  ObservableList<Movie>? get nowPlayingMovies => movieStore.nowPlayingMovies;

  ObservableList<Movie>? get upComingMovies => movieStore.upComingMovies;

  @action
  Future<void> toggleCarouselOption(bool value) async {
    showPopularMoviesInCarousel = value;
    carouselMovies = [];

    if (!showPopularMoviesInCarousel && trendingMovies != null) {
      carouselMovies = trendingMovies!;
      return;
    }

    if (showPopularMoviesInCarousel && popularMovies != null) {
      carouselMovies = popularMovies!;
      return;
    }

    fetchCarouselMovies();
  }

  @action
  Future<void> fetchCarouselMovies() async {
    carouselMoviesStatus = WidgetStatus.loading;

    await movieStore.fetchTrendingMovies();
    await movieStore.fetchPopularMovies();

    toggleCarouselOption(showPopularMoviesInCarousel);

    carouselMoviesStatus = WidgetStatus.ready;
  }

  @action
  Future<void> fetchNowPlayingMovies() async {
    nowPlayingMoviesStatus = WidgetStatus.loading;

    await movieStore.fetchNowPlayingMovies();

    nowPlayingMoviesStatus = WidgetStatus.ready;
  }

  @action
  Future<void> fetchUpComingMovies() async {
    upComingMoviesStatus = WidgetStatus.loading;

    await movieStore.fetchUpComingMovies();

    upComingMoviesStatus = WidgetStatus.ready;
  }
}
