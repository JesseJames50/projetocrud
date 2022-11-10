import 'dart:developer';
import 'movie_controller.dart';
import 'package:flutter/material.dart';
import 'movie_page .dart';
import 'movie_repository.dart';
import 'movie_single.dart';
import 'widgets/movie_list_tile.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final movieController = MovieController(MovieRepositoryHttp());

  @override
  void initState() {
    super.initState();
    log("primeiro método ao construir a tela pela primeira vez");
  }

  @override
  Widget build(BuildContext context) {
    log("espera future terminar");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Filmes"),
      ),
      body: FutureBuilder(
        future: movieController.getAllMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isEmpty) {
            log("future termina com dados, mas lista está vazia");
            return const Center(
              child: Text(
                  "Não há posts cadastrados\n\nVerifique o seu token ou cadastre novos posts\n\nLeia os TODO na aba de Problemas do VS Code"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            log("future termina com dados e lista contém posts");
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return MovieListTile(
                  index: index,
                  snapshot: snapshot,
                  onTap: () {
                    log("chama navegação para tela de post individual");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: RouteSettings(
                          name: "/movies/${snapshot.data?[index].id}",
                          arguments: snapshot.data?[index],
                        ),
                        builder: (context) => SingleMoviePage(
                          movieModel: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          log("tela em modo de carregamento enquanto espera future concluir");
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          log("navega para tela de novo filme");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MoviePage(),
            ),
          );
        },
        icon: const Icon(Icons.edit_note_rounded),
        label: const Text("Novo Filme"),
      ),
    );
  }
}
