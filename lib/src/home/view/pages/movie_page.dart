import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_db_app/src/models/cast_model.dart';
import '../../../models/movie_model.dart';
import '../../../models/text_model.dart';
import '../../../services/constants.dart';
import '../../../services/movie_service.dart';
import '../../components/widgets/back_button_widget.dart';
import '../../components/widgets/custom_flexible_space_bar.dart';
import '../../components/widgets/list_cast.dart';
import '../../components/widgets/rating_container.dart';
import '../../components/widgets/realese_date_container.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.movie});

  final Movie movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late Future<List<Cast>> castMovie;

  @override
  void initState() {
    super.initState();
    castMovie = MovieService(GetIt.I()).fetchMovieCredits(widget.movie.id);
  }

  final TextModel text = TextModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackButtonWidget(),
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.sizeOf(context).height * 0.8,
            pinned: true,
            floating: true,
            flexibleSpace: CustomFlexibleSpaceBar(
              posterUrl: '${Constants.imagePath}${widget.movie.posterPath}',
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      widget.movie.title ?? '',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.movie.overview ?? '',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReleaseDateContainer(
                              releaseDate: widget.movie.realeseDate ?? '',
                            ),
                            RatingContainer(
                                rating: widget.movie.voteAverage ?? 0),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      text.appTitle,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: FutureBuilder(
                          future: castMovie,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return ListCast(snapshot: snapshot);
                            } else {
                              if (snapshot.error != null) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else {
                                return Center(
                                  child: Text(text.noDate),
                                );
                              }
                            }
                          }),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
