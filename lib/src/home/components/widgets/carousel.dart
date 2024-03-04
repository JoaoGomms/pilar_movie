import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/src/models/movie_model.dart';

import '../../../services/constants.dart';
import '../../view/pages/movie_page.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    double carouselHeight = 300;
    double carouselWidth = 200;

    if (screenWidth >= 600) {
      carouselHeight = 400;
      carouselWidth = 300;
    }

    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: movies.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          var actualMovie = movies[itemIndex];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoviePage(
                    movie: actualMovie,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: carouselHeight,
                width: carouselWidth,
                child: Image.network(
                  '${Constants.imagePath}${actualMovie.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: carouselHeight,
          autoPlay: true,
          viewportFraction: kIsWeb ? 0.2 : 0.55,
          autoPlayCurve: Curves.fastOutSlowIn,
          pageSnapping: true,
          enlargeCenterPage: true,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
