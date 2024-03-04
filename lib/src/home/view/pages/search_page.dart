import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_db_app/src/home/view/controllers/search_controller.dart'
    as my;

import '../../components/widgets/list_search.dart';

class SearchPage extends StatefulWidget {
  final String searchString;

  const SearchPage(this.searchString, {Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  my.SearchController controller = GetIt.I();

  @override
  void initState() {
    super.initState();
    controller.search(widget.searchString);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Resultados para: ${widget.searchString}'),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Observer(builder: (context) {
            return controller.isSearching
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: ListSearchComponent(
                      movies: controller.searchMovies,
                    ),
                  );
          }),
        ),
      );
    });
  }
}
