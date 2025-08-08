import 'package:movie_explorer/features/domain/entities/trailer_entity.dart';

class TrailerModel extends TrailerEntity {
  TrailerModel({
    required super.id,
    required List<TrailerResultModel> super.results,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      id: json['id'],
      results: (json['results'] as List)
          .map((v) => TrailerResultModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': results
          .map((e) => (e as TrailerResultModel).toJson())
          .toList(),
    };
  }
}

class TrailerResultModel extends TrailerResultEntity {
  final String? iso6391;
  final String? iso31661;
  final int? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String? id;

  TrailerResultModel({
    required super.name,
    required super.key,
    required super.site,
    this.iso6391,
    this.iso31661,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory TrailerResultModel.fromJson(Map<String, dynamic> json) {
    return TrailerResultModel(
      name: json['name'],
      key: json['key'],
      site: json['site'],
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'key': key,
      'site': site,
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt,
      'id': id,
    };
  }
}
