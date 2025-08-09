class MovieEntity {
  final int id;
  final String title;
  final String? posterPath;
  final String? overview;
  final double? voteAverage;
  final String? releaseDate;
  final String? backdropPath;
  final String? rating;
  final String? videoKey;

  MovieEntity({
    required this.id,
    required this.title,
    this.posterPath,
    this.overview,
    this.voteAverage,
    this.releaseDate,
    this.backdropPath,
    this.rating,
    this.videoKey,
  });
}
