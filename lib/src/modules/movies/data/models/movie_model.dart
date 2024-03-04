class Movie {
  String? title;
  String? backDropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? realeseDate;
  double? voteAverage;
  int id;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.realeseDate,
    required this.voteAverage,
    required this.id,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    double? voteAverage = json["vote_average"] as double?;
    if (voteAverage != null) {
      voteAverage = voteAverage.toDouble();
    }

    return Movie(
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      realeseDate: json["release_date"],
      voteAverage: voteAverage,
      id: json["id"],
    );
  }
}
