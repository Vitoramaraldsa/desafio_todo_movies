import 'package:flutter/widgets.dart';

class MovieModel {
  final int id;
  final String nomeMovieModel;
  final String? posterPath;
  final String? popularidade;
  final String releaseDate;
  final int? voteCount;
  final String genres;

  MovieModel({
    required this.id,
    required this.nomeMovieModel,
    required this.posterPath,
    required this.popularidade,
    required this.releaseDate,
    required this.voteCount,
    required this.genres,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nomeMovieModel = json['original_title'],
        posterPath = json['poster_path'],
        popularidade = json['popularity'].toString(),
        releaseDate = json['release_date'],
        genres = json['genres'],
        voteCount = json['vote_count'];

  MovieModel copyWith({
    int? id,
    String? nomeMovieModel,
    ValueGetter<String?>? posterPath,
    ValueGetter<String?>? popularidade,
    String? releaseDate,
    ValueGetter<int?>? voteCount,
    String? genres,
  }) {
    return MovieModel(
      id: id ?? this.id,
      nomeMovieModel: nomeMovieModel ?? this.nomeMovieModel,
      posterPath: posterPath != null ? posterPath() : this.posterPath,
      popularidade: popularidade != null ? popularidade() : this.popularidade,
      releaseDate: releaseDate ?? this.releaseDate,
      voteCount: voteCount != null ? voteCount() : this.voteCount,
      genres: genres ?? this.genres,
    );
  }

  @override
  String toString() {
    return 'MovieModel(id: $id, nomeMovieModel: $nomeMovieModel, posterPath: $posterPath, popularidade: $popularidade, releaseDate: $releaseDate, voteCount: $voteCount, genres: $genres)';
  }
}
