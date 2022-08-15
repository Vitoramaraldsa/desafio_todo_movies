// ignore_for_file: public_member_api_docs, sort_constructors_first
class Genre {
  int id;
  String nome;

  Genre({
    required this.id,
    required this.nome,
  });

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['name'];
}
