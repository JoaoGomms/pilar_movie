import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_db_app/src/modules/movies/view/controllers/home_controller.dart';
import 'package:movie_db_app/src/modules/movies/data/services/movie_service.dart';
import 'package:movie_db_app/src/modules/movies/stores/movies_store.dart';

import '../modules/movies/view/controllers/search_controller.dart';
import 'http_client.dart/main.dart';

void registerDependencies() {
  GetIt.I.registerSingleton(Client());

  //Register Clients
  GetIt.I.registerSingleton(HttpClient(GetIt.I()));
  //Register Services
  GetIt.I.registerFactory(() => MovieService(GetIt.I()));

  //Register Stores
  GetIt.I.registerSingleton(MoviesStore(GetIt.I()));

  //Register Controllers
  GetIt.I.registerSingleton(HomeController(GetIt.I()));
  GetIt.I.registerSingleton(SearchController(GetIt.I()));
}
