import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todomoviesrepl/app/core/model/genre.dart';
import '../../app_api_config.dart';

class GenreController {
  static getGenres() async {
    http.Response _response = await http.get(Uri.parse(
        "${ApiConfiguration.genre_path}?api_key=${ApiConfiguration.api_key}"));
    Map<String, dynamic> responseJson = jsonDecode(_response.body);
    List<Genre> listaGenres = responseJson["genres"].map<Genre>((map) {
      return Genre.fromJson(map);
    }).toList();
    return listaGenres;
  }
}
