import 'package:flutter/material.dart';
import 'movie_controller.dart';
import 'movie_list.dart';
import '../model/movie_model.dart';
import 'movie_repository.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final formKey = GlobalKey<FormState>();
  final namemovieController = TextEditingController();
  final descriptionController = TextEditingController();
  final movieController = MovieController(MovieRepositoryHttp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Filmes'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: namemovieController,
              decoration: const InputDecoration(hintText: 'Filme'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Descrição'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (() async {
                await movieController.createMovie(MovieModel(
                    namemovieController.text, descriptionController.text));
                // ignore: use_build_context_synchronously
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const MovieListPage())));
              }),
              child: const Text("Cadastrar Filme"),
            )
          ],
        ),
      ),
    );
  }
}
