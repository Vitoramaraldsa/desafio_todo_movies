import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todomoviesrepl/app/core/model/filme.dart';
import '../../app_api_config.dart';

class FilmeController {
  static getFilme(int id) async {
    http.Response _response = await http.get(Uri.parse(
        "${ApiConfiguration.host}${id}?api_key=${ApiConfiguration.api_key}"));
    Map<String, dynamic> responseJson = jsonDecode(_response.body);
    Filme filme = Filme.fromJson(responseJson);
    return filme;
  }

  static getSimilarFilmes(int id) async {
    http.Response _response = await http.get(Uri.parse(
        "${ApiConfiguration.host}${id}/similar?api_key=${ApiConfiguration.api_key}"));
    Map<String, dynamic> responseJson = jsonDecode(_response.body);
    List<Filme> listaFilmes = responseJson["results"].map<Filme>((map) {
      return Filme.fromSimilarJson(map);
    }).toList();
    return listaFilmes;
  }
}
