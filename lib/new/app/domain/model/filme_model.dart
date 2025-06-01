import 'package:flutter/widgets.dart';

class Filme {
  final int id;
  final String nomeFilme;
  final String? posterPath;
  final String? popularidade;
  final String releaseDate;
  final int? voteCount;
  final String genres;

  Filme({
    required this.id,
    required this.nomeFilme,
    required this.posterPath,
    required this.popularidade,
    required this.releaseDate,
    required this.voteCount,
    required this.genres,
  });

  Filme.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nomeFilme = json['original_title'],
        posterPath = json['poster_path'],
        popularidade = json['popularity'].toString(),
        releaseDate = json['release_date'],
        genres = json['genres'],
        voteCount = json['vote_count'];

  Filme copyWith({
    int? id,
    String? nomeFilme,
    ValueGetter<String?>? posterPath,
    ValueGetter<String?>? popularidade,
    String? releaseDate,
    ValueGetter<int?>? voteCount,
    String? genres,
  }) {
    return Filme(
      id: id ?? this.id,
      nomeFilme: nomeFilme ?? this.nomeFilme,
      posterPath: posterPath != null ? posterPath() : this.posterPath,
      popularidade: popularidade != null ? popularidade() : this.popularidade,
      releaseDate: releaseDate ?? this.releaseDate,
      voteCount: voteCount != null ? voteCount() : this.voteCount,
      genres: genres ?? this.genres,
    );
  }

  @override
  String toString() {
    return 'Filme(id: $id, nomeFilme: $nomeFilme, posterPath: $posterPath, popularidade: $popularidade, releaseDate: $releaseDate, voteCount: $voteCount, genres: $genres)';
  }
}
