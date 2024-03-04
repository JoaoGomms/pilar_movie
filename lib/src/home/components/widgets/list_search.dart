import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../models/movie_model.dart';
import '../../../services/constants.dart';
import '../../view/pages/movie_page.dart';

class ListSearchComponent extends StatelessWidget {
  const ListSearchComponent({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: kIsWeb ? Axis.horizontal : Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var actualMovie = movies[index];

        return Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
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
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '${Constants.imagePath}${actualMovie.posterPath}',
                errorBuilder: (context, error, stackTrace) => const Column(),
                filterQuality: FilterQuality.high,
                height: kIsWeb ? 400 : null,
                width: kIsWeb ? 400 : null,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
