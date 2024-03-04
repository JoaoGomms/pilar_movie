import 'package:mobx/mobx.dart';
import 'package:movie_db_app/src/models/movie_model.dart';

import '../../../stores/movies_store.dart';
part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final MoviesStore store;

  ObservableList<Movie> searchMovies = ObservableList.of([]);

  @observable
  bool isSearching = false;

  _SearchControllerBase(this.store);

  @action
  Future<void> search(String search) async {
    isSearching = true;
    final searchResult = await store.fetchSearchMovies(search);
    searchMovies = ObservableList.of([]);
    searchMovies.addAll(searchResult);
    isSearching = false;
  }
}
