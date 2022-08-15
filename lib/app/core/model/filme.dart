// ignore_for_file: public_member_api_docs, sort_constructors_first
class Filme {
  int id;
  String nomeFilme;
  String posterPath;
  String? popularidade;
  String releaseDate;
  int? voteCount;
  List genres;

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

  Filme.fromSimilarJson(Map<String, dynamic> json)
      : id = json['id'],
        nomeFilme = json['original_title'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        genres = json['genre_ids'];
}
