import 'dart:convert';

class FavoriteModel {
  final String id;
  final int movieId;
  final String comment;

  FavoriteModel({
    required this.id,
    required this.movieId,
    required this.comment,
  });

  FavoriteModel copyWith({
    String? id,
    int? movieId,
    String? comment,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'movieId': movieId});
    result.addAll({'comment': comment});

    return result;
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'] ?? '',
      movieId: map['movieId']?.toInt() ?? 0,
      comment: map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source));
}
