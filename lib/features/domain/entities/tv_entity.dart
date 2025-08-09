class TvEntity {
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final String? backdropPath;
  final double? voteAverage;
  final String? firstAirDate;
  final String? videoKey;

  TvEntity({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.firstAirDate,
    this.videoKey,
  });
}
