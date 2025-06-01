import 'package:desafio_todo_movies/old/app/core/model/filme.dart';
import 'package:flutter/material.dart';
import '../app_api_config.dart';
import '../core/controllers/controller_movies.dart';

class TelaDetalhe extends StatelessWidget {
  const TelaDetalhe({super.key});

  @override
  Widget build(BuildContext context) {
    bool _tapLike = false;

    //filme principal
    int _filmeId = 9615;

    //busca o filme principal
    Future<Filme> buscarFilmePrincipal() async {
      Filme filme = await FilmeController.getFilme(_filmeId);
      return filme;
    }

    //busca os filmes similares ao filme de detalhes
    buscarSimilarFilmes() async {
      List<Filme> listaFilmes = await FilmeController.getSimilarFilmes(_filmeId);
      return listaFilmes;
    }

    //remove os outros caracteres da data
    toAno(String? ano) {
      return ano?.replaceRange(4, 10, "");
    }

    return FutureBuilder(
      future: buscarFilmePrincipal(),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: LayoutBuilder(
              builder:
                  (context, constraints) => SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(image: DecorationImage(image: Image.network("${ApiConfiguration.data_path}/w500/${snapshot.data.posterPath}").image, fit: BoxFit.cover)),
                              height: 350,
                            ),
                            Container(
                              height: 355,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(stops: [0.3, 1], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [Colors.transparent, Colors.black]),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 300, left: 30), child: Text("${snapshot.data.nomeFilme}", style: TextStyle(fontSize: 30))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30, top: 15),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("clicado");
                                    },
                                    child: Icon(Icons.favorite, size: 20),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 5), child: Text("${snapshot.data.voteCount} Likes", style: TextStyle(fontFamily: "HelveticaLight"))),
                                  Padding(padding: EdgeInsets.only(left: 15), child: Icon(Icons.star, size: 20)),
                                  Padding(padding: EdgeInsets.only(left: 5), child: Text("Popularity: ${snapshot.data.popularidade}", style: TextStyle(fontFamily: "HelveticaLight"))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        FutureBuilder<List<Filme>>(
                          future: buscarSimilarFilmes(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Filme>? listaFilmesSimilar = snapshot.data;
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: listaFilmesSimilar?.length,
                                itemBuilder: (context, index) {
                                  Filme? filmeSimilar = listaFilmesSimilar?[index];
                                  return Padding(
                                    padding: EdgeInsets.only(left: 30, right: 30),
                                    child: Card(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(image: Image.network("${ApiConfiguration.data_path}/w500/${filmeSimilar?.posterPath}").image, fit: BoxFit.cover),
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.only(bottom: 25, left: 25, right: 50),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(top: 20),
                                                        child: Text(
                                                          "${filmeSimilar?.nomeFilme}",
                                                          style: TextStyle(fontFamily: "HelveticaNormal", fontSize: 16),
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(top: 10),
                                                        child: Row(children: [Text("${toAno(filmeSimilar?.releaseDate)}", style: TextStyle(fontFamily: "HelveticaNormal", fontSize: 15))]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.add_circle),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  void setState(Null Function() param0) {}
}
