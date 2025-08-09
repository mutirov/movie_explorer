import 'package:movie_explorer/features/domain/entities/tv_entity.dart';

class TvModel extends TvEntity {
  TvModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.posterPath,
    super.backdropPath,
    super.voteAverage,
    super.firstAirDate,
    super.videoKey,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json['id'],
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] != null)
          ? (json['vote_average'] as num).toDouble()
          : null,
      firstAirDate: json['first_air_date'],
      // Trailer için genelde ayrı API isteği atılır, burada tek istekte gelmez
      videoKey: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
      'first_air_date': firstAirDate,
    };
  }

  static TvModel fromEntity(TvEntity tvEntity) {
  return TvModel(
    id: tvEntity.id,
    name: tvEntity.name,
    overview: tvEntity.overview,
    posterPath: tvEntity.posterPath,
    backdropPath: tvEntity.backdropPath,
    voteAverage: tvEntity.voteAverage,
    firstAirDate: tvEntity.firstAirDate,
    videoKey: tvEntity.videoKey,
  );
  }
}