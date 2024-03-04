import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_db_app/src/home/components/horizontal_banners_section.dart';
import 'package:movie_db_app/src/home/view/controllers/home_controller.dart';
import 'package:movie_db_app/src/theme/colors/base_colors.dart';
import 'package:movie_db_app/src/models/text_model.dart';

import '../../../models/movie_model.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Movie> moviesToShow;

  HomeController controller = GetIt.I();

  @override
  void initState() {
    controller.fetchCarouselMovies();
    controller.movieStore.fetchUpComingMovies();
    controller.movieStore.fetchNowPlayingMovies();
    super.initState();
  }

  final TextModel text = TextModel();
  final BaseColors color = BaseColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          text.appTitle,
          style: TextStyle(fontSize: 30, color: color.titleColor),
        ),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchSection(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            controller.setShowPopularMoviesInCarousel(false),
                        child: Text(text.buttonTrending),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            controller.setShowPopularMoviesInCarousel(true),
                        child: Text(text.buttonPopular),
                      ),
                    ],
                  ),
                ),
                HorizontalMoviesSection(
                  movies: controller.carouselMovies,
                  status: controller.carouselMoviesStatus,
                  carouselMode: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                HorizontalMoviesSection(
                  sectionLabel: text.nowPlayingMovies,
                  movies: controller.movieStore.nowPlayingMovies,
                  status: controller.nowPlayingMoviesStatus,
                ),
                const SizedBox(
                  height: 20,
                ),
                HorizontalMoviesSection(
                  sectionLabel: text.upComingMovies,
                  movies: controller.movieStore.upComingMovies,
                  status: controller.upComingMoviesStatus,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSearchSection() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: controller.textEditingController,
          onSubmitted: navigateToSearchPage,
          decoration: InputDecoration(
            hintText: text.buttonSearch,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        )),
        const SizedBox(
          width: 8,
        ),
        IconButton(
            onPressed: () {
              String searchText = controller.textEditingController.text;

              navigateToSearchPage(searchText);
            },
            icon: const Icon(Icons.search_rounded)),
      ],
    );
  }

  void navigateToSearchPage(String searchText) {
    if (searchText.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(searchText),
      ),
    );
  }
}
