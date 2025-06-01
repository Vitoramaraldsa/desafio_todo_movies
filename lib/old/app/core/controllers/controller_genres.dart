import 'dart:convert';
import 'package:desafio_todo_movies/old/app/core/model/genre.dart';
import 'package:http/http.dart' as http;
import '../../app_api_config.dart';

class GenreController {
  static getGenres() async {
    http.Response response = await http.get(Uri.parse("${ApiConfiguration.genre_path}?api_key=${ApiConfiguration.api_key}"));
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    List<Genre> listaGenres =
        responseJson["genres"].map<Genre>((map) {
          return Genre.fromJson(map);
        }).toList();
    return listaGenres;
  }
}
