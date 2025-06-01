import 'package:desafio_todo_movies/old/app/core/controllers/controller_movies.dart';
import 'package:desafio_todo_movies/old/app/pages/detalhe_dos_filmes.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

//widget principal da aplicação
class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    //FilmeController.getFilme(9615);
    FilmeController.getSimilarFilmes(9615);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppTheme.appColor,
        cardColor: AppTheme.appColor,
        scaffoldBackgroundColor: AppTheme.appColor,
        iconTheme: const IconThemeData(color: AppTheme.fontColor),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontFamily: "Helvetica")),
      ),
      home: const TelaDetalhe(),
      debugShowCheckedModeBanner: false,
    );
  }
}
