class TrailerEntity {
  final int id;
  final List<TrailerResultEntity> results;

  TrailerEntity({required this.id, required this.results});

  get length => null;
}

class TrailerResultEntity {
  final String name;
  final String key;
  final String site;

  TrailerResultEntity({
    required this.name,
    required this.key,
    required this.site,
  });
}
