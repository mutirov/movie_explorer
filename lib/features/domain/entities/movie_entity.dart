class MovieEntity {
  final int id;
  final String title;
  final String? posterPath;
  final String? overview;
  final double? voteAverage;
  final String? releaseDate;

  MovieEntity({
    required this.id,
    required this.title,
    this.posterPath,
    this.overview,
    this.voteAverage,
    this.releaseDate,
  });
}
