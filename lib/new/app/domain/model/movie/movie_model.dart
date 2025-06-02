import 'dart:convert';

class MovieModel {
  final int id;
  final String originalTitle;
  final String? posterPath;
  final String? popularidade;
  final DateTime releaseDate;
  final int? voteCount;
  final String genres;

  MovieModel({
    required this.id,
    required this.originalTitle,
    required this.posterPath,
    required this.popularidade,
    required this.releaseDate,
    required this.voteCount,
    required this.genres,
  });

  MovieModel copyWith({
    int? id,
    String? originalTitle,
    String? posterPath,
    String? popularidade,
    DateTime? releaseDate,
    int? voteCount,
    String? genres,
  }) {
    return MovieModel(
      id: id ?? this.id,
      originalTitle: originalTitle ?? this.originalTitle,
      posterPath: posterPath ?? this.posterPath,
      popularidade: popularidade ?? this.popularidade,
      releaseDate: releaseDate ?? this.releaseDate,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['originalTitle'] = originalTitle;
    if (posterPath != null) {
      map['posterPath'] = posterPath;
    }
    if (popularidade != null) {
      map['popularidade'] = popularidade;
    }
    map['releaseDate'] = releaseDate.millisecondsSinceEpoch;
    if (voteCount != null) {
      map['voteCount'] = voteCount;
    }
    map['genres'] = genres;

    return map;
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id']?.toInt() ?? 0,
      originalTitle: map['originalTitle'] ?? '',
      posterPath: map['posterPath'],
      popularidade: map['popularidade'],
      releaseDate: DateTime.fromMillisecondsSinceEpoch(map['releaseDate']),
      voteCount: map['voteCount']?.toInt(),
      genres: map['genres'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieModel(id: $id,'
        ' originalTitle: $originalTitle,'
        ' posterPath: $posterPath,'
        ' popularidade: $popularidade,'
        ' releaseDate: $releaseDate,'
        ' voteCount: $voteCount,'
        ' genres: $genres)';
  }
}
