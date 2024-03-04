// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$textEditingControllerAtom =
      Atom(name: '_HomeControllerBase.textEditingController', context: context);

  @override
  TextEditingController get textEditingController {
    _$textEditingControllerAtom.reportRead();
    return super.textEditingController;
  }

  @override
  set textEditingController(TextEditingController value) {
    _$textEditingControllerAtom.reportWrite(value, super.textEditingController,
        () {
      super.textEditingController = value;
    });
  }

  late final _$nowPlayingMoviesStatusAtom = Atom(
      name: '_HomeControllerBase.nowPlayingMoviesStatus', context: context);

  @override
  WidgetStatus? get nowPlayingMoviesStatus {
    _$nowPlayingMoviesStatusAtom.reportRead();
    return super.nowPlayingMoviesStatus;
  }

  @override
  set nowPlayingMoviesStatus(WidgetStatus? value) {
    _$nowPlayingMoviesStatusAtom
        .reportWrite(value, super.nowPlayingMoviesStatus, () {
      super.nowPlayingMoviesStatus = value;
    });
  }

  late final _$upComingMoviesStatusAtom =
      Atom(name: '_HomeControllerBase.upComingMoviesStatus', context: context);

  @override
  WidgetStatus? get upComingMoviesStatus {
    _$upComingMoviesStatusAtom.reportRead();
    return super.upComingMoviesStatus;
  }

  @override
  set upComingMoviesStatus(WidgetStatus? value) {
    _$upComingMoviesStatusAtom.reportWrite(value, super.upComingMoviesStatus,
        () {
      super.upComingMoviesStatus = value;
    });
  }

  late final _$carouselMoviesStatusAtom =
      Atom(name: '_HomeControllerBase.carouselMoviesStatus', context: context);

  @override
  WidgetStatus? get carouselMoviesStatus {
    _$carouselMoviesStatusAtom.reportRead();
    return super.carouselMoviesStatus;
  }

  @override
  set carouselMoviesStatus(WidgetStatus? value) {
    _$carouselMoviesStatusAtom.reportWrite(value, super.carouselMoviesStatus,
        () {
      super.carouselMoviesStatus = value;
    });
  }

  late final _$carouselMoviesAtom =
      Atom(name: '_HomeControllerBase.carouselMovies', context: context);

  @override
  List<Movie> get carouselMovies {
    _$carouselMoviesAtom.reportRead();
    return super.carouselMovies;
  }

  @override
  set carouselMovies(List<Movie> value) {
    _$carouselMoviesAtom.reportWrite(value, super.carouselMovies, () {
      super.carouselMovies = value;
    });
  }

  late final _$toggleCarouselOptionAsyncAction =
      AsyncAction('_HomeControllerBase.toggleCarouselOption', context: context);

  @override
  Future<void> toggleCarouselOption(bool value) {
    return _$toggleCarouselOptionAsyncAction
        .run(() => super.toggleCarouselOption(value));
  }

  late final _$fetchCarouselMoviesAsyncAction =
      AsyncAction('_HomeControllerBase.fetchCarouselMovies', context: context);

  @override
  Future<void> fetchCarouselMovies() {
    return _$fetchCarouselMoviesAsyncAction
        .run(() => super.fetchCarouselMovies());
  }

  late final _$fetchNowPlayingMoviesAsyncAction = AsyncAction(
      '_HomeControllerBase.fetchNowPlayingMovies',
      context: context);

  @override
  Future<void> fetchNowPlayingMovies() {
    return _$fetchNowPlayingMoviesAsyncAction
        .run(() => super.fetchNowPlayingMovies());
  }

  late final _$fetchUpComingMoviesAsyncAction =
      AsyncAction('_HomeControllerBase.fetchUpComingMovies', context: context);

  @override
  Future<void> fetchUpComingMovies() {
    return _$fetchUpComingMoviesAsyncAction
        .run(() => super.fetchUpComingMovies());
  }

  @override
  String toString() {
    return '''
textEditingController: ${textEditingController},
nowPlayingMoviesStatus: ${nowPlayingMoviesStatus},
upComingMoviesStatus: ${upComingMoviesStatus},
carouselMoviesStatus: ${carouselMoviesStatus},
carouselMovies: ${carouselMovies}
    ''';
  }
}
