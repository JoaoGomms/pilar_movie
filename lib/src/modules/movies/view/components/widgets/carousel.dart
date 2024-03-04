import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/src/modules/movies/data/models/movie_model.dart';

import '../../../data/services/constants.dart';
import '../../pages/movie_page.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    bool isLargeScreen = screenWidth >= 800;
    double carouselHeight = screenHeight * 0.5;

    return Center(
      child: SizedBox(
        width: isLargeScreen ? screenWidth * 0.8 : screenWidth,
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
            viewportFraction: isLargeScreen ? 0.4 : 0.55,
            autoPlayCurve: Curves.fastOutSlowIn,
            pageSnapping: true,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
