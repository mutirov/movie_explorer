
import 'package:movie_explorer/features/domain/entities/tv_entity.dart';

class TvModel extends TvEntity {
  TvModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.posterPath,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json['id'],
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'overview': overview,
      'poster_path': posterPath,
    };
  }
}

