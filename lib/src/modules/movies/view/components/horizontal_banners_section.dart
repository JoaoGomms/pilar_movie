import 'package:flutter/material.dart';
import 'package:movie_db_app/src/modules/movies/view/components/widget_status_enum.dart';
import 'package:movie_db_app/src/modules/movies/view/components/widgets/carousel.dart';
import 'package:movie_db_app/src/modules/movies/view/components/widgets/list_movies.dart';
import 'package:movie_db_app/src/modules/movies/view/pages/movie_page.dart';

import '../../../../theme/colors/base_colors.dart';
import '../../data/models/movie_model.dart';

class HorizontalMoviesSection extends StatelessWidget {
  final String sectionLabel;
  final List<Movie> movies;
  final WidgetStatus? status;
  final bool carouselMode;

  const HorizontalMoviesSection({
    super.key,
    this.sectionLabel = '',
    required this.movies,
    this.status,
    this.carouselMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionLabel,
          style: TextStyle(
            fontSize: 20,
            color: BaseColors().textColor,
          ),
        ),
        const SizedBox(height: 10),
        if (status == WidgetStatus.error) ...[
          const Center(
            child: Text('Error'),
          )
        ],
        if (status == WidgetStatus.loading) ...[
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
        if (status == WidgetStatus.ready) ...[
          carouselMode
              ? Carousel(movies: movies)
              : HorizontalSlider(
                  movies: movies,
                  onTap: (movie) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoviePage(movie: movie)));
                  })
        ]
      ],
    );
  }
}
