class Movie {
  late String posterPath;
  late String releaseDate;
  late String title;
  late String overView;
  late bool adult;
  late num voteAverage;

  Movie(
      {required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.overView,
      required this.adult,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      overView: json['overview'] as String,
      adult: json['adult'] ?? false,
      voteAverage: json['vote_average'] as num,
    );
  }

  String get postUrl => 'https://image.tmdb.org/t/p/w500/${this.posterPath}';
}
