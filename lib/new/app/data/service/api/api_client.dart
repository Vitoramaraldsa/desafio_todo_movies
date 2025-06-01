import 'dart:io';
import 'package:desafio_todo_movies/new/app/config/environment.dart' as env;
import 'package:desafio_todo_movies/new/app/utils/result.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
abstract interface class ApiClientInterface {
  Future<Result> get({required String path});
}

class ApiClient implements ApiClientInterface {
  ApiClient(this.client);

  final http.Client client;

  final String _host = env.Environment.host;
  final Map<String, String> _headers = {'api_key': env.Environment.apiKey};

  @override
  Future<Result> get({required String path}) async {
    final http.Response response = await client.get(Uri(path: "$_host$path"), headers: _headers);
    if (response.statusCode == HttpStatus.ok) {
      return Result.ok(response.body);
    } else {
      return Result.error(Exception("Falha na requisição http - codigo: ${response.statusCode}"));
    }
  }
}
